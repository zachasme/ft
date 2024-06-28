class Oda::Sag < ApplicationRecord
  belongs_to :periode, class_name: "Oda::Periode", counter_cache: true
  belongs_to :kategori, class_name: "Oda::Sagskategori"
  belongs_to :status, class_name: "Oda::Sagsstatus"
  belongs_to :type, class_name: "Oda::Sagstype"
  belongs_to :deltundersag, class_name: "Oda::Sag"
  belongs_to :fremsatundersag, class_name: "Oda::Sag"

  has_many :emneord_sags, class_name: "Oda::EmneordSag"
  has_many :emneords, through: :emneord_sags, source: :emneord

  has_many :sagstrin
  has_many :sag_dokuments
  has_many :dokuments, through: :sag_dokuments, source: :dokument

  scope :chronological, -> { order(periode_id: :desc, nummernumerisk: :desc) }
  scope :matches, ->(search) { where("oda_sags.titel LIKE ?", "%#{search}%") if search.present? }
  scope :casetype, ->(id) { joins(:type).where(type: { id: }) }
end
