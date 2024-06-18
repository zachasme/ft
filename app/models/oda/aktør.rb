class Oda::Aktør < ApplicationRecord
  has_many :stemmes
  has_many :afstemnings, through: :stemmes
  has_many :fra_aktør_aktørs, foreign_key: :fraaktør_id, class_name: "Oda::AktørAktør"
  has_many :til_aktør_aktørs, foreign_key: :tilaktør_id, class_name: "Oda::AktørAktør"
  has_many :fraaktørs, through: :fra_aktør_aktørs
  has_many :tilaktørs, through: :til_aktør_aktørs

  belongs_to :type, class_name: "Oda::Aktørtype"
  belongs_to :periode

  scope :alphabetical, -> { order(:navn) }
  scope :chronological, -> { order(opdateringsdato: :desc) }
  scope :matches, ->(search) { where("oda_aktørs.navn Like ?", "%#{search}%") if search.present? }
  scope :actortype, ->(id) { joins(:type).where(type: { id: }) }
end
