class Oda::Aktørtype < ApplicationRecord
  include Synchronizable

  has_many :aktører, inverse_of: :type
end
