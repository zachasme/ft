class Membership < ApplicationRecord
  belongs_to :person
  belongs_to :party

  def self.refresh
    Odata::Resource.new(
      "AktørAktør",
      after: maximum(:updated_at),
      filter: "rolleid eq 15"
    ).each do |aktøraktør|
      party = Party.find_by(ftid: aktøraktør["fraaktørid"])
      person = Person.find_by(ftid: aktøraktør["tilaktørid"])
      next if party.nil? || person.nil?
      Membership.upsert({
        ftid: aktøraktør["id"],
        person_id: person.id,
        party_id: party.id
      }, unique_by: :ftid)
    end
  end
end
