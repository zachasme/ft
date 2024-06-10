class Vote < ApplicationRecord
  enum :type, for: 0, against: 1, absent: 2, abstain: 3

  belongs_to :person
  belongs_to :decision
end
