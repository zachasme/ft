class Oda::Afstemning < ApplicationRecord
  belongs_to :sagstrin
  has_one :sag, through: :sagstrin
  has_many :stemmes
  belongs_to :type, class_name: "Oda::Afstemningstype"
  belongs_to :møde, class_name: "Oda::Møde"

  scope :chronological, -> { includes(:møde).order(oda_mødes: { periode_id: :desc }, nummer: :desc) }
  scope :matches, ->(search) { joins(:sag).where("oda_sags.titel LIKE ?", "%#{search}%") if search.present? }
end
