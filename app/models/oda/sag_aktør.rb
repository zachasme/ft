class Oda::SagAktør < Oda::OdaRecord
  include Synchronizable

  belongs_to :sag
  belongs_to :aktør
end
