require "open-uri"

BACKUP_URL = "https://oda.ft.dk/odapublish/oda.bak"
BACKUP_USER = "ODAwebpublish"
BACKUP_PASS = "b56ff26a-c19b-4322-a3c4-614de155781d"
BACKUP_FILE = "tmp/storage/oda.bak"
DOCKER_NAME = "sql-server-bak"

DIRECTORY = Rails.root.join("tmp/storage/export")

namespace :backup do
  task import: :environment do
    download(
      "https://github.com/zachasme/ft/releases/latest/download/export.tar.gz",
      Rails.root.join("tmp/storage/import.tar.gz")
    )

    puts "[UNPACK]"
    FileUtils.mkdir_p(DIRECTORY)
    `tar -xzf tmp/storage/import.tar.gz`

    Dir.foreach(DIRECTORY) do |filename|
      path = DIRECTORY + filename
      resource = File.basename(filename, ".json")

      next if File.directory? path
      Kernel.const_get("Oda::#{resource}").delete_all

      bar = nil
      File.readlines(path, chomp: true).each do |line|
        # first line is count
        if bar.nil?
          bar = ProgressBar.new(line.to_i)
          bar.puts path
          next
        end
        bar.increment!
        row = JSON.parse(line)
        row.transform_keys! do |key|
          case
          when key == "id"
             key
          when key == "type"
             "typenavn"
          when key.end_with?("id")
             key.delete_suffix("id") + "_id"
          else
             key
          end
        end
        Kernel.const_get("Oda::#{resource}").insert_all([ row ])
      end
    end
  end

  task export: :environment do
    download(BACKUP_URL, BACKUP_FILE, http_basic_authentication: [ BACKUP_USER, BACKUP_PASS ])

    FileUtils.mkdir_p(DIRECTORY)
    FileUtils.chmod("a+w", DIRECTORY)

    # ensure service
    puts "[BOOT]"
    unless `docker ps -q -f name=#{DOCKER_NAME}`.present?
      `docker run \
        -p 1433:1433 \
        --name #{DOCKER_NAME} \
        -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=#{BACKUP_PASS} \
        -v #{Rails.root.join("tmp/storage")}:/data \
        -d mcr.microsoft.com/mssql/server:2022-latest `
    end

    # restore
    puts "[RESTORE]"
    puts `docker exec #{DOCKER_NAME} /opt/mssql-tools/bin/sqlcmd \
      -S localhost -U SA -P #{BACKUP_PASS} \
      -Q "RESTORE DATABASE oda FROM DISK = '/data/oda.bak'
          WITH MOVE 'ODA'     TO '/var/opt/mssql/data/ODA.mdf',
                MOVE 'ODA_log' TO '/var/opt/mssql/data/ODA_log.ldf'
      "`

    # import
    puts "[SERIALIZE]"
    client = TinyTds::Client.new username: "SA", password: BACKUP_PASS, host: "localhost"
    # find oda tables
    tables = ApplicationRecord.connection.tables.filter_map do |table|
      table.delete_prefix("oda_").singularize.camelize if table.start_with? "oda_"
    end

    tables.each do |resource|
      result = client.execute("SELECT COUNT(*) AS count FROM oda.dbo.#{resource}")
      count = result.first["count"]
      bar = ProgressBar.new(count)
      bar.puts resource

      path = DIRECTORY.join("#{resource}.json")
      File.open(path, mode: "w") do |file|
        file.puts(count)
        client.execute("SELECT * FROM oda.dbo.#{resource} ORDER BY id").each do |row|
          bar.increment!
          file.puts(row.to_json)
        end
      end
    end

    puts "[PACK]"
    `tar -czf tmp/storage/export.tar.gz tmp/storage/export/*`
  end
end

def download(url, destination, **options)
  return if File.exist? destination
  total = nil
  URI.open(url,
    **options,
    content_length_proc: ->(t) { total = t },
    progress_proc: ->(s) { puts s.fdiv(total)*100 }
  ) do |download|
    IO.copy_stream(download, destination)
  end
end
