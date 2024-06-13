require "open-uri"

BACKUP_URL = "https://oda.ft.dk/odapublish/oda.bak"
BACKUP_USER = "ODAwebpublish"
BACKUP_PASS = "b56ff26a-c19b-4322-a3c4-614de155781d"
DESTINATION = "tmp/storage/oda.bak"
DOCKER_NAME = "sql-server-bak"
ODA = "F:\SQL-DB\ODA.mdf"
LOG = "G:\SQL-LOG\ODA_log.ldf "

TABLES = [
  "__RefactorLog",
  "Afstemning",
  "Afstemningstype",
  "Aktør",
  "AktørAktør",
  "AktørAktørRolle",
  "Aktørtype",
  "Dagsordenspunkt",
  "DagsordenspunktDokument",
  "DagsordenspunktSag",
  "Dokument",
  "DokumentAktør",
  "DokumentAktørRolle",
  "Dokumentkategori",
  "Dokumentstatus",
  "Dokumenttype",
  "Emneord",
  "EmneordDokument",
  "EmneordSag",
  "Emneordstype",
  "EntitetBeskrivelse",
  "Fil",
  "IdMap",
  "KolloneBeskrivelse",
  "Møde",
  "MødeAktør",
  "Mødestatus",
  "Mødetype",
  "Omtryk",
  "Periode",
  "Sag",
  "SagAktør",
  "SagAktørRolle",
  "SagDokument",
  "SagDokumentRolle",
  "Sagskategori",
  "Sagsstatus",
  "Sagstrin",
  "SagstrinAktør",
  "SagstrinAktørRolle",
  "SagstrinDokument",
  "Sagstrinsstatus",
  "Sagstrinstype",
  "Sagstype",
  "Sambehandlinger",
  "Slettet",
  "SlettetMap",
  "Stemme",
  "Stemmetype",
  "SyncLogger"
]

task download: :environment do
  download(BACKUP_URL, BACKUP_USER, BACKUP_PASS, DESTINATION) unless File.exist? DESTINATION

  `mkdir -p tmp/storage/export && chmod a+w tmp/storage/export`

  # ensure service
  unless `docker ps -q -f name=#{DOCKER_NAME}`.present?
    puts `docker run \
      -p 1433:1433 \
      --name #{DOCKER_NAME} \
      -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=#{BACKUP_PASS} \
      -v #{Dir.pwd}/tmp/storage:/data \
      -d mcr.microsoft.com/mssql/server:2022-latest `
  end

  # restore
  query = "docker exec #{DOCKER_NAME} /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P #{BACKUP_PASS} -Q"
  puts `#{query} "RESTORE DATABASE oda FROM DISK = '/data/oda.bak' \
     WITH MOVE 'ODA' TO '/var/opt/mssql/data/ODA.mdf',
          MOVE 'ODA_log' TO '/var/opt/mssql/data/ODA_log.ldf'"`

  # import
  client = TinyTds::Client.new username: "SA", password: BACKUP_PASS, host: "localhost"

  # find oda tables
  tables = ActiveRecord::Base.connection.tables.filter_map do |table|
    table.delete_prefix("oda_").singularize.camelize if table.start_with? "oda_"
  end

  tables.each do |resource|
    result = client.execute("SELECT COUNT(*) AS count FROM oda.dbo.#{resource}")
    bar = ProgressBar.new(result.first["count"])
    bar.puts resource
    inserts = client.execute("SELECT * FROM oda.dbo.#{resource} ORDER BY id").collect do |row|
      bar.increment!
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
    bar.puts "Persisting..."
    Kernel.const_get("Oda::#{resource}").insert_all(inserts)
  rescue Exception => e
    puts inserts
    raise e
  end




  # TABLES.each do |table|
  #   puts `docker exec #{DOCKER_NAME} /opt/mssql-tools/bin/bcp \
  #       "select * from oda.dbo.#{table}" queryout "/data/export/#{table}.csv" \
  #       -S localhost -U SA -P "#{BACKUP_PASS}" -k -c -r"\r\n"`
  # end
end

task sync: :environment do
  files = [ "Periode", "Sagskategori", "Sagsstatus", "Sagstype", "Sag" ]
  files.each do |file|
    puts file
    CSV.foreach("tmp/storage/export/#{file}.csv",
      row_sep: "\r\n", col_sep: "\t"
    ) do |row|
    end
  end
end

def download(url, user, pass, destination)
  total = nil
  URI.open(url,
    http_basic_authentication: [ user, pass ],
    content_length_proc: ->(t) { total = t },
    progress_proc: ->(s) { puts s.fdiv(total)*100 }
  ) do |download|
    IO.copy_stream(download, destination)
  end
end
