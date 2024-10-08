class Oda::Dokumentkategori < Oda::OdaRecord
  include Synchronizable

  scope :alphabetical, -> { order(:kategori) }
end
