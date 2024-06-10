class Party < ApplicationRecord
  has_many :memberships

  def self.refresh
    Odata::Resource.new(
      "Aktør",
      after: maximum(:updated_at),
      filter: "typeid eq 4"
    ).each do |aktør|
      Party.upsert({
        ftid: aktør["id"],
        name: aktør["navn"],
        abbreviation: aktør["gruppenavnkort"]
      }, unique_by: :ftid)
    end
  end
end
