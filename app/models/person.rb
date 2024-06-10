class Person < ApplicationRecord
  has_many :votes
  has_many :memberships

  def self.refresh
    Odata::Resource.new(
      "Aktør",
      after: maximum(:updated_at),
      filter: "typeid eq 5"
    ).each do |aktør|
      Person.upsert({
        ftid: aktør["id"],
        name: aktør["navn"],
        biography: aktør["biografi"]
      }, unique_by: :ftid)
    end
  end
end
