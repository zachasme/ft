class Oda::Slettet < Oda::OdaRecord
  include Synchronizable

  belongs_to :slettetmap, class_name: "Oda::SlettetMap"

  scope :chronological, -> { order(opdateringsdato: :desc) }
end
