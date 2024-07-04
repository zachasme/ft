require "open-uri"

module Synchronizable
  extend ActiveSupport::Concern

  BASE = "https://oda.ft.dk/api/"
  SECOND_DECIMALS = 3

  class_methods do
    def last_synchronization
      maximum(:opdateringsdato)
    end

    def synchronize
      raise "restore backup before synchronization" if last_synchronization.nil?

      transaction do
        new_entities.each do |entity|
          entity.transform_keys! do |key|
            case
            when key == "type"
               "typenavn"
            when key.end_with?("id") && key != "id"
               key.delete_suffix("id") + "_id"
            else
               key
            end
          end
          create_with(entity).find_or_create_by!(id: entity["id"])
        end
      end
      true
    end

    def new_entities
      entities = []

      url = BASE + CGI.escape(resource)
      url += "?$filter=opdateringsdato gt datetime'#{last_synchronization.iso8601(SECOND_DECIMALS)}'"
      puts url
      response = JSON.parse(URI.open(URI.parse(url)).read)
      loop do
        entities += response["value"]
        break unless response["odata.nextLink"].present?
        url = response["odata.nextLink"]
        response = JSON.parse(URI.open(url).read)
      end

      entities
    end

    private
      def resource
        name.delete_prefix("Oda::")
      end
  end
end
