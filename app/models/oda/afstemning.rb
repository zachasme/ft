class Oda::Afstemning < ApplicationRecord
  belongs_to :sagstrin
  has_one :sag, through: :sagstrin
  has_many :stemmes
  belongs_to :type, class_name: "Oda::Afstemningstype"

  scope :chronological, -> { order(:nummer) }
  scope :matches, ->(x) { joins(:sag).where("lower(oda_sags.titel) LIKE lower(?)", "%#{x}%") }
end
