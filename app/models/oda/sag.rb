class Oda::Sag < Oda::OdaRecord
  include Synchronizable
  include Searchable

  has_searchables :titel, :titelkort, :resume

  # TODO: Whats up with
  #       - Aktstykke
  #       - Almdel
  #       - Debat
  #       - EUsag
  #       - Forslag

  belongs_to :periode, counter_cache: true
  belongs_to :kategori, class_name: "Oda::Sagskategori", optional: true
  belongs_to :status, class_name: "Oda::Sagsstatus"
  belongs_to :type, class_name: "Oda::Sagstype"
  belongs_to :deltundersag, class_name: "Oda::Sag", optional: true
  belongs_to :fremsatundersag, class_name: "Oda::Sag", optional: true

  has_many :emneord_sager
  has_many :emneord, through: :emneord_sager, source: :emneord

  has_many :sagstrin
  has_many :sag_dokumenter
  has_many :dokumenter, through: :sag_dokumenter, source: :dokument

  scope :chronological, -> { order(periode_id: :desc, nummernumerisk: :desc) }
  scope :matches, ->(search) { where("oda_sager.titel LIKE ?", "%#{search}%") if search.present? }
  scope :casetype, ->(id) { joins(:type).where(type: { id: }) }
end
