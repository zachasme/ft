class Oda::Emneord < ApplicationRecord
  include Synchronizable

  has_many :emneord_dokuments, class_name: "Oda::EmneordDokument"
  has_many :dokuments, through: :emneord_dokuments, source: :dokument
  has_many :emneord_sags, class_name: "Oda::EmneordSag"
  has_many :sags, through: :emneord_sags, source: :sag

  belongs_to :type, class_name: "Oda::Emneordstype"

  scope :matches, ->(search) { where("oda_emneords.emneord LIKE ?", "%#{search}%") if search.present? }
  scope :subjecttype, ->(id) { where(type_id: id) }

  scope :by_emneord_sags_count, -> { order(emneord_sags_count: :desc) }
end
