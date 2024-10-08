class Oda::Dokumenttype < Oda::OdaRecord
  include Synchronizable

  scope :alphabetical, -> { order(:typenavn) }
end
