class Oda::Dokument < ApplicationRecord
  has_many :dokument_aktørs, class_name: "Oda::DokumentAktør"
  has_many :sag_dokuments, class_name: "Oda::SagDokument"
  has_many :sagstrin_dokuments, class_name: "Oda::SagstrinDokument"
  has_many :aktørs, through: :dokument_aktørs, source: :aktør
  has_many :sags, through: :sag_dokuments, source: :sag
  has_many :sagstrin, through: :sagstrin_dokuments, source: :sagstrin

  has_many :emneord_dokuments, class_name: "Oda::EmneordDokument"
  has_many :emneords, through: :emneord_dokuments, source: :emneord

  has_many :fils

  belongs_to :kategori, class_name: "Oda::Dokumentkategori"
  belongs_to :status, class_name: "Oda::Dokumentstatus"
  belongs_to :type, class_name: "Oda::Dokumenttype"

  scope :chronological, -> { order(dato: :desc) }
  scope :matches, ->(search) { where("oda_dokuments.titel LIKE ?", "%#{search}%") if search.present? }
end
