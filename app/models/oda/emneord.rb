class Oda::Emneord < ApplicationRecord
  include Synchronizable

  has_many :emneord_dokumenter, class_name: "Oda::EmneordDokument"
  has_many :dokumenter, through: :emneord_dokumenter, source: :dokument
  has_many :emneord_sager, class_name: "Oda::EmneordSag"
  has_many :sager, through: :emneord_sager, source: :sag

  belongs_to :type, class_name: "Oda::Emneordstype"

  scope :matches, ->(search) { where("oda_emneord.emneord LIKE ?", "%#{search}%") if search.present? }
  scope :subjecttype, ->(id) { where(type_id: id) }

  scope :by_emneord_sager_count, -> { order(emneord_sager_count: :desc) }
end
