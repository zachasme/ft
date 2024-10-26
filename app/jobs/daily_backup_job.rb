class DailyBackupJob < ApplicationJob
  def perform(dbname)
    filename = "#{dbname}-#{Date.current}.sqlite3.gz.enc"
    upload(encrypt(compress(backup(dbname))), filename)
    filename
  end

  private
    def backup(dbname)
      dbfile = Rails.configuration.database_configuration[Rails.env][dbname]["database"]
      Tempfile.new.tap do |destination|
        pull = SQLite3::Database.new(dbfile)
        push = SQLite3::Database.new(destination)
        backup = SQLite3::Backup.new(push, "main", pull, "main")
        backup.step(-1)
        backup.finish
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
      Rails.application.credentials.daily_backup => {
        bucket:, access_key_id:, secret_access_key:
      }
      system(
        "curl --aws-sigv4 'aws:amz:auto:s3' \
              --user '#{access_key_id}:#{secret_access_key}' \
              --upload-file #{file} \
              #{bucket}/#{as}",
        exception: true
      )
    end
end
