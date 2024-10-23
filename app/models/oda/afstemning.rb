class Oda::Afstemning < Oda::OdaRecord
  include Synchronizable

  has_many :stemmer
  belongs_to :sagstrin, optional: true
  belongs_to :møde
  belongs_to :type, class_name: "Oda::Afstemningstype"
  has_one :sag,     through: :sagstrin
  has_one :periode, through: :møde

  scope :with_period, ->(period_id) { where(periode: { id: period_id }) }
  scope :chronological, -> { joins(:møde).order(oda_møder: { periode_id: :desc }, nummer: :desc) }
end
