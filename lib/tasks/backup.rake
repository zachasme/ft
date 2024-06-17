require "open-uri"

BACKUP_URL = "https://oda.ft.dk/odapublish/oda.bak"
BACKUP_USER = "ODAwebpublish"
BACKUP_PASS = "b56ff26a-c19b-4322-a3c4-614de155781d"
BACKUP_FILE = "tmp/storage/oda.bak"
EXPORT_FILE = "tmp/storage/export.tar.gz"
DOCKER_NAME = "sql-server-bak"

EXPORT_DIR = Rails.root.join("tmp/storage/export")
IMPORT_DIR = Rails.root.join("tmp/storage/import")

BATCH_SIZE = 100_000

namespace :backup do
  task export: :environment do
    download(BACKUP_URL, BACKUP_FILE, http_basic_authentication: [ BACKUP_USER, BACKUP_PASS ])

    FileUtils.rm_rf(EXPORT_DIR)
    FileUtils.mkdir_p(EXPORT_DIR)
    FileUtils.chmod("a+w", EXPORT_DIR)

    # ensure service
    puts "[BOOT]"
    unless `docker ps -q -f name=#{DOCKER_NAME}`.present?
      puts `docker run \
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

    # tables
    puts "tables?"
    result = `docker exec #{DOCKER_NAME} /opt/mssql-tools/bin/sqlcmd \
     -S localhost -U SA -P #{BACKUP_PASS} \
     -Q "SELECT table_schema+'.'+table_name FROM oda.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'" \
    `.split("\n")
    tables = result.filter_map do |line|
      if line.start_with?("dbo.") && !line.start_with?("dbo.__")
        line.chomp.strip.delete_prefix("dbo.")
      end
    end
    tables.sort!

    # import
    puts "[SERIALIZE]"
    client = TinyTds::Client.new username: "SA", password: BACKUP_PASS, host: "localhost"

    # batches serialize
    bar = ProgressBar.new(tables.length)
    tables.each do |resource|
      bar.puts resource
      bar.increment!
      0.step do |batch|
        path = EXPORT_DIR.join("#{resource}.#{batch}.json")
        rows = client.execute("
          SELECT * FROM oda.dbo.#{resource}
          ORDER BY id
          OFFSET #{batch * BATCH_SIZE} ROWS
          FETCH NEXT #{BATCH_SIZE} ROWS ONLY
        ").to_a
        break if rows.empty?
        File.write(path, rows.to_json)
      end
    end

    puts "[PACK]"
    `tar -czf #{EXPORT_FILE} -C #{EXPORT_DIR} .`
    size = File.size(EXPORT_FILE) / 1000000
    puts "#{EXPORT_FILE} (#{size}MB)"
  end

  task import: :environment do
    download(
      "https://github.com/zachasme/ft/releases/latest/download/export.tar.gz",
      Rails.root.join(EXPORT_FILE)
    )

    puts "[UNPACK]"
    FileUtils.rm_rf(IMPORT_DIR)
    FileUtils.mkdir_p(IMPORT_DIR)
    `tar -xzf #{EXPORT_FILE} -C #{IMPORT_DIR}`

    files = Dir.foreach(IMPORT_DIR).sort.filter_map do |filename|
      path = IMPORT_DIR + filename
      basename = File.basename(filename, ".json")
      resource, batch = basename.split(".")
      next unless !File.directory?(path) && Kernel.const_defined?("Oda::#{resource}")
      [ path, batch, Kernel.const_get("Oda::#{resource}") ]
    end

    bar = ProgressBar.new(files.length)
    files.each do |path, batch, resource|
      bar.puts "#{path} (batch #{batch})"
      bar.increment!

      resource.delete_all

      rows = JSON.parse(File.open(path).read)
      inserts = rows.collect do |row|
        row.transform_keys do |key|
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
      end
      resource.insert_all(inserts)
    end
  end
end

def download(url, destination, **options)
  return if File.exist? destination
  bar = nil
  prev = 0
  URI.open(url, **options,
    content_length_proc: ->(t) do
      bar = ProgressBar.new(t)
      bar.puts "[DOWNLOAD]"
    end,
    progress_proc: ->(s) do
      bar.increment!(s - prev)
      prev = s
    end
  ) do |download|
    IO.copy_stream(download, destination)
  end
end
