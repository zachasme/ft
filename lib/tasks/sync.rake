task sync: :environment do
  SynchronizationJob.perform_now
end
