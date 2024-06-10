require "open-uri"

class SynchronizationJob < ApplicationJob
  def perform
    # Odata.new("Afstemning", expand: "Sagstrin/Sag").each do |decision|
    #   Decision.upsert({
    #     ftid: decision["id"],
    #     name: decision.dig("Sagstrin", "Sag", "titelkort"),
    #     comment: decision["kommentar"],
    #     passed: decision["vedtaget"],
    #     number: decision["nummer"]
    #   }, unique_by: :ftid)
    # end

    Person.refresh
    Party.refresh
    Membership.refresh
  end
end
