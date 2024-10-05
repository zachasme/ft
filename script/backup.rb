require "open-uri"
require "tiny_tds"

BACKUP_PASS = "b56ff26a-c19b-4322-a3c4-614de155781d"
BACKUP_FILE = "tmp/storage/oda.bak"
EXPORT_FILE = "tmp/storage/export.tar.gz"
DOCKER_NAME = "sql-server-bak"

EXPORT_DIR = Rails.root.join("tmp/storage/export")
IMPORT_DIR = Rails.root.join("tmp/storage/import")

BATCH_SIZE = 100_000


tables = ["oda_dokumenter"]

client = TinyTds::Client.new username: "SA", password: BACKUP_PASS, host: "localhost"

# batches serialize
bar = ProgressBar.new(tables.length)
tables.each do |resource|
  bar.puts resource
  bar.increment!
  0.step do |batch|
    path = EXPORT_DIR.join("#{resource}.#{batch.to_s.rjust(2, '0')}.json")
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
