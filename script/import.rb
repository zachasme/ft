require_relative "../config/environment"

# download
puts `curl -q -L -o /tmp/daily.tar.gz https://github.com/zachasme/ft/releases/latest/download/daily.tar.gz`

# clean
`rm -rf tmp/storage/import`
`mkdir -p tmp/storage/import`

# unpack
`tar -xzf /tmp/daily.tar.gz -C tmp/storage/import`

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

  unless resource.maximum(:opdateringsdato).nil?
    puts "already synced"
    next
  end

  # reset
  resource.delete_all

  # write
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

# rebuild sqlite fts5
Oda::Sag.rebuild_search_index
