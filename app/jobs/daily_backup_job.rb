class DailyBackupJob < ApplicationJob
  def perform
    filename = "production-#{Date.current}.sqlite3"
    filepath = "tmp/storage/#{filename}"

    # add these to your rails credentials file nested in `daily_backup`
    Rails.application.credentials.daily_backup => {
      passphrase:,
      bucket:,
      access_key_id:,
      secret_access_key:
    }

    system "sqlite3 storage/production.sqlite3 '.backup #{filepath}'" or raise "backup failed"
    system "gzip --force #{filepath}" or raise "gzip failed"
    system "gpg --yes --batch --passphrase='#{passphrase}' --output '#{filepath}.gz.gpg' -c '#{filepath}.gz'" or raise "gpg failed"
    system "curl --aws-sigv4 'aws:amz:auto:s3' --user '#{access_key_id}:#{secret_access_key}' --upload-file #{filepath}.gz.gpg #{bucket}/#{filename}.gz.gpg" or raise "curl failed"

    filepath
  end
end
