class Vote < ApplicationRecord
  enum :what, for: 0, against: 1, absent: 2, abstain: 3

  belongs_to :voter, class_name: "Person"
  belongs_to :decision
end
