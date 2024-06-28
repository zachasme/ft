class Oda::Aktørtype < ApplicationRecord
  has_many :aktørs, inverse_of: :type
end
