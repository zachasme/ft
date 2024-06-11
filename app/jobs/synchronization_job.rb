require "open-uri"

class SynchronizationJob < ApplicationJob
  def perform
    # people
    Odata::Resource.new(
      "Aktør",
      after: Person.maximum(:ftts),
      filter: "typeid eq 5"
    ).each_with_progress do |aktør|
      Person.upsert({
        ftid: aktør["id"],
        ftts: aktør["opdateringsdato"],
        name: aktør["navn"],
        biography: aktør["biografi"]
      }, unique_by: :ftid)
    end

    # parties
    Odata::Resource.new(
      "Aktør",
      after: Party.maximum(:ftts),
      filter: "typeid eq 4"
    ).each_with_progress do |aktør|
      Party.upsert({
        ftid: aktør["id"],
        ftts: aktør["opdateringsdato"],
        name: aktør["navn"],
        abbreviation: aktør["gruppenavnkort"],
        started_at: aktør["startdato"],
        ended_at: aktør["slutdato"]
      }, unique_by: :ftid)
    end

    # memberships
    Odata::Resource.new(
      "AktørAktør",
      after: Membership.maximum(:ftts),
      filter: "rolleid eq 15"
    ).each_with_progress do |aktøraktør|
      party = Party.find_by(ftid: aktøraktør["fraaktørid"])
      person = Person.find_by(ftid: aktøraktør["tilaktørid"])
      next if party.nil? || person.nil?
      Membership.upsert({
        ftid: aktøraktør["id"],
        ftts: aktøraktør["opdateringsdato"],
        person_id: person.id,
        party_id: party.id
      }, unique_by: :ftid)
    end

    # decisions
    Odata::Resource.new(
      "Afstemning",
      expand: [ "Sagstrin/Sag", "Sagstrin/Sagstrinstype" ],
      after: Decision.maximum(:ftts)
    ).each_with_progress do |afstemning|
      name = afstemning.dig("Sagstrin", "Sag", "titelkort") || afstemning.dig("Sagstrin", "Sag", "titel")
      next unless name.present?
      Decision.upsert({
        ftid: afstemning["id"],
        ftts: afstemning["opdateringsdato"],
        number: afstemning["nummer"],
        comment: afstemning["kommentar"],
        passed: afstemning["vedtaget"],
        casetype: afstemning.dig("Sagstrin", "Sagstrinstype", "type"),
        name: name
      }, unique_by: :ftid)
    end

    # votes
    Odata::Resource.new(
      "Stemme",
      after: Vote.maximum(:ftts),
    ).each_with_progress do |stemme|
      voter = Person.find_by(ftid: stemme["aktørid"])
      decision = Decision.find_by(ftid: stemme["afstemningid"])
      next if voter.nil? || decision.nil?
      what = case stemme["typeid"].to_i
      when 1
        :for
      when 2
        :against
      when 3
        :absent
      when 4
        :abstain
      end

      Vote.upsert({
        ftid: stemme["id"],
        ftts: stemme["opdateringsdato"],
        voter_id: voter.id,
        decision_id: decision.id,
        what: what
      }, unique_by: :ftid)
    end
  end
end
