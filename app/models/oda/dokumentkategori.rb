class Oda::Dokumentkategori < ApplicationRecord
  include Synchronizable

  scope :alphabetical, -> { order(:kategori) }
end
