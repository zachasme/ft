class Decision < ApplicationRecord
  belongs_to :meetings
  has_many :votes

  scope :chronological, -> { order ftts: :desc }
  scope :matches, ->(x) { where("lower(name) LIKE lower(?)", "%#{x}%") }
end
