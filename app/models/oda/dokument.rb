class Oda::Dokument < ApplicationRecord
  include Synchronizable

  belongs_to :kategori, class_name: "Oda::Dokumentkategori"
  belongs_to :status, class_name: "Oda::Dokumentstatus"
  belongs_to :type, class_name: "Oda::Dokumenttype"

  has_many :fils
  has_many :omtryks
  has_many :sag_dokuments
  has_many :dokument_aktørs
  has_many :emneord_dokuments
  has_many :sagstrin_dokuments

  has_many :aktørs,   through: :dokument_aktørs,    source: :aktør
  has_many :emneords, through: :emneord_dokuments,  source: :emneord
  has_many :sags,     through: :sag_dokuments,      source: :sag
  has_many :sagstrin, through: :sagstrin_dokuments, source: :sagstrin

  scope :reprinted, -> { joins(:omtryks) }
  scope :chronological, -> { order(opdateringsdato: :desc) }
  scope :matches, ->(search) { where("oda_dokuments.titel LIKE ?", "%#{search}%") if search.present? }

  scope :with_category, ->(id) { where(kategori_id: id) }
  scope :with_status, ->(id) { where(status_id: id) }
  scope :with_type, ->(id) { where(type_id: id) }
end
