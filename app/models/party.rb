class Party < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :person

  scope :chronological, -> { order started_at: :desc }

  def period
    "#{started_at.year} - #{ended_at.year}"
  end
end
