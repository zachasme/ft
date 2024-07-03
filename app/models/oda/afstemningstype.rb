class Oda::Afstemningstype < ApplicationRecord
  include Synchronizable

  has_many :afstemnings, inverse_of: :type
end
