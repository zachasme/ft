class Oda::Afstemning < ApplicationRecord
  belongs_to :sagstrin
  has_one :sag, through: :sagstrin
  has_many :stemmes

  scope :chronological, -> { order(opdateringsdato: :desc) }
  scope :matches, ->(x) { joins(:sag).where("lower(oda_sags.titel) LIKE lower(?)", "%#{x}%") }
end
