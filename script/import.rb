require_relative "../config/environment"
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

# download
puts `curl -q -L -o /tmp/daily.tar.gz https://github.com/zachasme/ft/releases/latest/download/daily.tar.gz`

# clean
`rm -rf tmp/storage/import`
`mkdir -p tmp/storage/import`

# unpack
`tar -xzf /tmp/daily.tar.gz -C tmp/storage/import`

# prepare
files = tables.filter_map do |resource|
  path = "tmp/storage/import/" + resource + ".json"
  next unless !File.directory?(path) && Kernel.const_defined?("Oda::#{resource}")
  [ path, Kernel.const_get("Oda::#{resource}") ]
end

# reset
if ENV["RESET"]
  files.each do |path, resource|
    puts "Restting #{path}"

    resource.delete_all
  end
end

# import
files.each do |path, resource|
  puts "Importing #{path}"

  unless resource.maximum(:opdateringsdato).nil?
    puts "… already synced"
    next
  end

  # write
  ActiveRecord::Base.transaction do
    JSON.parse(File.open(path).read).each_slice(10_000).with_index do |slice, i|
      puts "slice #{i}"
      inserts = slice.collect do |row|
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

# rebuild sqlite fts5
puts "Search index"
Oda::Sag.rebuild_search_index

# update counts
puts("Emneord counters")
Oda::Emneord.all.each do |emneord|
  Oda::Emneord.reset_counters(
    emneord.id,
    :emneord_sager_count,
    :emneord_dokumenter_count
  )
end
puts("Periode counters")
Oda::Periode.all.each do |periode|
  Oda::Periode.reset_counters(
    periode.id,
    :aktører_count,
    :møder_count,
    :sager_count,
  )
end

puts "Done!"
