class Stage < ApplicationRecord
  belongs_to :bill
  has_one :decision
end
