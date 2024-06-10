class Vote < ApplicationRecord
  enum :type, for: 0, against: 1, absent: 2, abstain: 3

  belongs_to :person
  belongs_to :decision

  def self.refresh
    Odata::Resource.new(
      "Stemme",
      after: maximum(:updated_at),
    ).each do |aktør|
      voter = Person.find_by(ftid: aktøraktør["aktørid"])
      next if voter.nil?
      Vote.upsert({
        ftid: aktør["id"],
        voter_id: voter.id,
        type: aktør["typeid"],
      }, unique_by: :ftid)
    end
  end
end
