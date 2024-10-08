class Oda::Emneordstype < Oda::OdaRecord
  include Synchronizable

  has_many :emneord, inverse_of: :type
end
