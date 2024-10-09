class DailyBackupJob < ApplicationJob
  def perform
    filename = "production-#{Date.current}.sqlite3"
    filepath = "tmp/storage/#{filename}"

    raise "backup failed" unless system "sqlite3 storage/production.sqlite3 '.backup #{filepath}'"
    raise "gzip failed "  unless system "gzip --force #{filepath}"
    raise "gpg failed"    unless system "gpg --yes --batch --passphrase='#{Rails.application.credentials.backup_passphrase}' --output '#{filepath}.gz.gpg' -c '#{filepath}.gz'"
    raise "curl failed"   unless system "curl --aws-sigv4 'aws:amz:auto:s3' \
                                              --user '#{Rails.application.credentials.backup_access_key_id}:#{Rails.application.credentials.backup_secret_access_key}' \
                                              --upload-file #{filepath}.gz.gpg \
                                              #{Rails.application.credentials.backup_bucket}/#{filename}.gz.gpg"

    puts "backup complete!"
  end
end
