class Oda::Aktørtype < ApplicationRecord
  include Synchronizable

  has_many :aktørs, inverse_of: :type
end
