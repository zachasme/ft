class Oda::Omtryk < Oda::OdaRecord
  include Synchronizable

  belongs_to :dokument
end
