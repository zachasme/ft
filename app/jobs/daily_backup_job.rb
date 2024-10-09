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

    raise "backup failed" unless system "sqlite3 storage/production.sqlite3 '.backup #{filepath}'"
    raise "gzip failed"   unless system "gzip --force #{filepath}"
    raise "gpg failed"    unless system "gpg --yes --batch --passphrase='#{passphrase}' --output '#{filepath}.gz.gpg' -c '#{filepath}.gz'"
    raise "curl failed"   unless system "curl --aws-sigv4 'aws:amz:auto:s3' --user '#{access_key_id}:#{secret_access_key}' --upload-file #{filepath}.gz.gpg #{bucket}/#{filename}.gz.gpg"

    puts "backup complete!"
  end
end
