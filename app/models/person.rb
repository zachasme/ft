class Person < ApplicationRecord
  has_many :votes, inverse_of: :voter
  has_many :memberships
  has_many :parties, -> { chronological }, through: :memberships

  scope :alphabetical, -> { order name: :asc }
end
