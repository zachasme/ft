class Oda::Møde < Oda::OdaRecord
  include Synchronizable

  belongs_to :periode, counter_cache: true
  belongs_to :type, class_name: "Oda::Mødetype"
  belongs_to :status, class_name: "Oda::Mødestatus"

  has_many :møde_aktører
  has_many :dagsordenspunkter
  has_many :afstemninger

  scope :chronological, -> { order(dato: :desc) }
end
