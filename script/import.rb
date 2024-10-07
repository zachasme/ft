require_relative "../config/environment"

# download
puts `aria2c -q -c -d tmp/storage -x 5 https://github.com/zachasme/ft/releases/latest/download/daily.zip`

# clean
`rm -rf tmp/storage/import`
`mkdir -p tmp/storage/import`

# unpack
`unzip tmp/storage/daily.zip -d tmp/storage/import`

# prepare
files = Dir.foreach("tmp/storage/import").sort.filter_map do |filename|
  puts filename
  path = "tmp/storage/import/" + filename
  resource = File.basename(filename, ".json")
  next unless !File.directory?(path) && Kernel.const_defined?("Oda::#{resource}")
  [ path, Kernel.const_get("Oda::#{resource}") ]
end

# import
files.each do |path, resource|
  puts "#{path}"

  # reset
  resource.delete_all

  # write
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

# update counts
puts("Emneord counters")
Oda::Emneord.all.each do |emneord|
  Oda::Emneord.reset_counters(
    emneord.id,
    :emneord_sags_count,
    :emneord_dokuments_count
  )
end
puts("Periode counters")
Oda::Periode.all.each do |periode|
  Oda::Periode.reset_counters(
    periode.id,
    :aktørs_count,
    :mødes_count,
    :sags_count,
  )
end

# rebuild sqlite fts5
Oda::Sag.rebuild_search_index
