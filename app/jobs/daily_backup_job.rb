class DailyBackupJob < ApplicationJob
  def perform(dbname)
    filename = "#{dbname}-#{Date.current}.sqlite3.gz.enc"
    upload(encrypt(compress(backup(dbname))), filename)
    filename
  end

  private
    def backup(dbname)
      source_file = Rails.configuration.database_configuration.dig(Rails.env, dbname, "database")
      source_db = SQLite3::Database.new(source_file)
      Tempfile.new.tap do |destination_file|
        destination_db = SQLite3::Database.new(destination_file)
        execution = SQLite3::Backup.new(destination_db, "main", source_db, "main")
        execution.step(-1)
        execution.finish
      end
    end

    def compress(contents)
      ActiveSupport::Gzip.compress(contents)
    end

    def encrypt(contents)
      file = Tempfile.new
      Rails.application.encrypted(file).write(contents)
      file.path
    end

    def upload(file, as)
      Rails.application.credentials.daily_backup => { bucket:, access_key_id:, secret_access_key: }
      system(
        "curl --aws-sigv4 'aws:amz:auto:s3' \
              --user '#{access_key_id}:#{secret_access_key}' \
              --upload-file #{file} \
              #{bucket}/#{as}",
        exception: true
      )
    end
end
