class Oda::Emneordstype < ApplicationRecord
  has_many :emneord, inverse_of: :type
end
