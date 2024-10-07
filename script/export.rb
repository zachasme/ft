require_relative "../config/environment"

dockername = "folketracker-backup"
plainpass = ENV["MSSQL_SA_PASSWORD"] || "Hunter2!"
sqlcmd = "sqlcmd -C -H localhost -U SA -P #{plainpass}"

# puts `#{sqlcmd} -Q "SELECT table_schema+'.'+table_name FROM oda.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"`
tables = [
  "Fil",
  "Sagstrinsstatus",
  "IdMap",
  "Sagstrinstype",
  "KolloneBeskrivelse",
  "Sagstrin",
  "MødeAktør",
  "Afstemning",
  "Omtryk",
  "Aktørtype",
  "SagAktørRolle",
  "Aktør",
  "SagAktør",
  "AktørAktørRolle",
  "SagDokumentRolle",
  "AktørAktør",
  "SagDokument",
  "Dagsordenspunkt",
  "SagstrinAktørRolle",
  "Dokumentkategori",
  "SagstrinAktør",
  "Dokumentstatus",
  "SagstrinDokument",
  "Dokumenttype",
  "Sambehandlinger",
  "Dokument",
  # "__RefactorLog",
  "SlettetMap",
  "DagsordenspunktDokument",
  "Afstemningstype",
  "Slettet",
  "DagsordenspunktSag",
  "Mødestatus",
  "Stemmetype",
  "DokumentAktørRolle",
  "Mødetype",
  "Stemme",
  "DokumentAktør",
  "Periode",
  "SyncLogger",
  "Emneordstype",
  "Møde",
  "Emneord",
  "Sagskategori",
  "EmneordDokument",
  "Sagsstatus",
  "EmneordSag",
  "Sagstype",
  "EntitetBeskrivelse",
  "Sag"
]

# clean
`rm -rf tmp/storage/export /tmp/daily.zip /tmp/daily.tar.gz`
`mkdir -p tmp/storage/export`

# download
puts `aria2c -q -d /tmp -x 5 https://ODAwebpublish:b56ff26a-c19b-4322-a3c4-614de155781d@oda.ft.dk/odapublish/oda.bak`

# container (not in gh action)
unless ENV['GITHUB_WORKSPACE']
  puts `docker rm -f #{dockername}`
  puts `docker run \
    -p 1433:1433 \
    --name #{dockername} \
    -e ACCEPT_EULA=Y -e MSSQL_SA_PASSWORD=#{plainpass} \
    -v /tmp:/tmp \
    -d mcr.microsoft.com/mssql/server:2022-latest`

  # health hack
  sleep 5
end

# restore
puts `#{sqlcmd} \
  -Q "RESTORE DATABASE oda FROM DISK = '/tmp/oda.bak'
      WITH MOVE 'ODA'     TO '/var/opt/mssql/data/ODA.mdf',
            MOVE 'ODA_log' TO '/var/opt/mssql/data/ODA_log.ldf'
  "`

# format
#   `head` removes trailing "rows affected" line
#   `paste` concats without newline
tables.each do |table|
  puts table
  `echo $( \
    #{sqlcmd} -y0 -Q "SELECT * FROM oda.dbo.#{table} FOR JSON AUTO, INCLUDE_NULL_VALUES;" \
    | head -n -1 | paste -d"\\0" -s \
  ) > tmp/storage/export/#{table}.json`
end

# pack
`zip --junk-paths /tmp/daily.zip tmp/storage/export/*`
`tar -czf /tmp/daily.tar.gz -C tmp/storage/export .`

# release
`gh release create "v$(date +%Y.%m.%d)" /tmp/daily.zip /tmp/daily.tar.gz --generate-notes`
