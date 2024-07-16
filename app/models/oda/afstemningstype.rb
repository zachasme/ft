class Oda::Afstemningstype < ApplicationRecord
  include Synchronizable

  has_many :afstemninger, inverse_of: :type
end
