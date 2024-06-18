class Oda::Afstemning < ApplicationRecord
  belongs_to :sagstrin
  has_one :sag, through: :sagstrin
  has_many :stemmes
  belongs_to :type, class_name: "Oda::Afstemningstype"

  scope :chronological, -> { order(:nummer) }
  scope :matches, ->(search) { joins(:sag).where("oda_sags.titel LIKE ?", "%#{search}%") if search.present? }
end
