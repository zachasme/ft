require_relative "../config/environment"

tables = [
  "Periode",
  "Mødestatus",
  "Mødetype",
  "Møde",
  "Sagskategori",
  "Sagsstatus",
  "Sagstype",
  "Sag",
  "Sagstrinstype",
  "Sagstrinsstatus",
  "Sagstrin",
  "Afstemningstype",
  "Afstemning",
  "AktørAktørRolle",
  "AktørAktør",
  "Aktørtype",
  "Aktør",
  "Dokumentkategori",
  "Dokumentstatus",
  "Dokumenttype",
  "Dokument",
  "Dagsordenspunkt",
  "DagsordenspunktDokument",
  "DagsordenspunktSag",
  "DokumentAktørRolle",
  "DokumentAktør",
  "Emneordstype",
  "Emneord",
  "EmneordDokument",
  "EmneordSag",
  "EntitetBeskrivelse",
  "Fil",
  "KolloneBeskrivelse",
  "MødeAktør",
  "Omtryk",
  "SagAktørRolle",
  "SagAktør",
  "SagDokumentRolle",
  "SagDokument",
  "SagstrinAktørRolle",
  "SagstrinAktør",
  "SagstrinDokument",
  "Sambehandlinger",
  "SlettetMap",
  "Slettet",
  "Stemmetype",
  "Stemme"
]

# download
puts `curl -q -L -o /tmp/daily.tar.gz https://github.com/zachasme/ft/releases/latest/download/daily.tar.gz`

# clean
`rm -rf tmp/storage/import`
`mkdir -p tmp/storage/import`

# unpack
`tar -xzf /tmp/daily.tar.gz -C tmp/storage/import`

# prepare
resources = tables.filter_map do |table|
  Kernel.const_get("Oda::#{table}")
end

# reset
if ENV["RESET"]
  resources.each do |resource|
    puts "Restting #{resource.name}"

    resource.delete_all
  end
end

# import
resources.each do |resource|
  puts "Importing #{resource.name}"

  # resumable
  unless resource.maximum(:opdateringsdato).nil?
    puts "… already synced"
    next
  end

  # write
  resource.transaction do
    0.step do |batch|
      path = "tmp/storage/import/#{resource.name.demodulize}.#{batch.to_s.rjust(2, '0')}.json"
      puts path
      break unless File.exist?(path)
      inserts = JSON.parse(File.open(path).read).collect do |row|
        row.transform_keys do |key|
          case
          when key == "id"
              key
          when key == "type"
              "typenavn"
          when key == "spørgsmålsid"
              "spørgsmål_id"
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
Oda::Emneord.transaction do
  Oda::Emneord.all.each do |emneord|
    Oda::Emneord.reset_counters(
      emneord.id,
      :emneord_sager_count,
      :emneord_dokumenter_count
    )
  end
end

puts("Periode counters")
Oda::Periode.transaction do
  Oda::Periode.all.each do |periode|
    Oda::Periode.reset_counters(
      periode.id,
      :aktører_count,
      :møder_count,
      :sager_count,
    )
  end
end

puts "Done!"
