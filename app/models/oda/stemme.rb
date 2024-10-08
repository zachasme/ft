class Oda::Stemme < Oda::OdaRecord
  include Synchronizable

  belongs_to :aktør
  belongs_to :afstemning

  scope :chronological, -> { order(opdateringsdato: :desc) }
  belongs_to :type, class_name: "Oda::Stemmetype"
end
