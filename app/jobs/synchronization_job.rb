require "open-uri"

class SynchronizationJob < ApplicationJob
  def perform
    odata = Odata.new("https://oda.ft.dk/api/Afstemning?$expand=Sagstrin/Sag&$orderby=id desc&$inlinecount=allpages")
    odata.each do |decision|
      Decision.upsert({
        ftid: decision["id"],
        name: decision.dig("Sagstrin", "Sag", "titelkort"),
        comment: decision["kommentar"],
        passed: decision["vedtaget"],
        number: decision["nummer"]
      }, unique_by: :ftid)
    end
  end
end
