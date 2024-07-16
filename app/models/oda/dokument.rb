class Oda::Dokument < ApplicationRecord
  include Synchronizable

  belongs_to :kategori, class_name: "Oda::Dokumentkategori"
  belongs_to :status, class_name: "Oda::Dokumentstatus"
  belongs_to :type, class_name: "Oda::Dokumenttype"

  has_many :filer
  has_many :omtryk
  has_many :sag_dokumenter
  has_many :dokument_aktører
  has_many :emneord_dokumenter
  has_many :sagstrin_dokumenter

  has_many :aktører,  through: :dokument_aktører,    source: :aktør
  has_many :emneord,  through: :emneord_dokumenter,  source: :emneord
  has_many :sager,    through: :sag_dokumenter,      source: :sag
  has_many :sagstrin, through: :sagstrin_dokumenter, source: :sagstrin

  scope :reprinted, -> { joins(:omtryk) }
  scope :chronological, -> { order(opdateringsdato: :desc) }
  scope :matches, ->(search) { where("oda_dokumenter.titel LIKE ?", "%#{search}%") if search.present? }

  scope :with_category, ->(id) { where(kategori_id: id) }
  scope :with_status, ->(id) { where(status_id: id) }
  scope :with_type, ->(id) { where(type_id: id) }
end
