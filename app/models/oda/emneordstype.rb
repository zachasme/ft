class Oda::Emneordstype < ApplicationRecord
  include Synchronizable

  has_many :emneord, inverse_of: :type
end
