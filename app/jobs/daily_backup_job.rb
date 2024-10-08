class DailyBackupJob < ApplicationJob
  def perform
    `sqlite storage/oda_production.sqlite3 ".backup 'tmp/storage/oda_production-$(date '+%Y-%m-%d-%H-%M-%S').sqlite3'"`
  end
end
