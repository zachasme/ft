class Bill < ApplicationRecord
  has_many :stages

  scope :chronological, -> { order ftts: :desc }
end
