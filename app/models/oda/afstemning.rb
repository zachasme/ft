class Oda::Afstemning < ApplicationRecord
  include Synchronizable

  has_many :stemmes
  belongs_to :sagstrin
  belongs_to :møde
  belongs_to :type, class_name: "Oda::Afstemningstype"
  has_one :sag,     through: :sagstrin
  has_one :periode, through: :møde

  scope :with_period, ->(period_id) { where(periode: { id: period_id }) }
  scope :chronological, -> { includes(:møde).order(oda_mødes: { periode_id: :desc }, nummer: :desc) }
  scope :matches, ->(search) { joins(:sag).where("oda_sags.titel LIKE ?", "%#{search}%") if search.present? }
end
