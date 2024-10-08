class Oda::Dokumentstatus < Oda::OdaRecord
  include Synchronizable

  scope :alphabetical, -> { order(:status) }
end
