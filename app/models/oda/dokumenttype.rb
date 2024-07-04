class Oda::Dokumenttype < ApplicationRecord
  include Synchronizable

  scope :alphabetical, -> { order(:typenavn) }
end
