class Oda::Emneord < ApplicationRecord
  has_many :emneord_dokuments, class_name: "Oda::EmneordDokument"
  has_many :dokuments, through: :emneord_dokuments, source: :dokument
  has_many :emneord_sags, class_name: "Oda::EmneordSag"
  has_many :sags, through: :emneord_sags, source: :sag

  scope :matches, ->(search) { where("oda_emneords.emneord LIKE ?", "%#{search}%") if search.present? }
end
