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

    system! "sqlite3 storage/production.sqlite3 '.backup #{filepath}'"
    system! "gzip --force #{filepath}"
    system! "xgpg --yes --batch --passphrase='#{passphrase}' --output '#{filepath}.gz.gpg' -c '#{filepath}.gz'"
    system! "curl --aws-sigv4 'aws:amz:auto:s3' --user '#{access_key_id}:#{secret_access_key}' --upload-file #{filepath}.gz.gpg #{bucket}/#{filename}.gz.gpg"

    filepath
  end

  private
    def system!(*args)
      system(*args, exception: true)
    end
end
