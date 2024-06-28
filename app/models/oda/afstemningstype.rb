class Oda::Afstemningstype < ApplicationRecord
  has_many :afstemnings, inverse_of: :type
end
