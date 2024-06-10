class Decision < ApplicationRecord
  belongs_to :meetings
  has_many :votes
end
