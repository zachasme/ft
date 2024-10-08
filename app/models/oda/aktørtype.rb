class Oda::Aktørtype < Oda::OdaRecord
  include Synchronizable

  has_many :aktører, inverse_of: :type
end
