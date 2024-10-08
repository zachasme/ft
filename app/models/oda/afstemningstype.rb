class Oda::Afstemningstype < Oda::OdaRecord
  include Synchronizable

  has_many :afstemninger, inverse_of: :type
end
