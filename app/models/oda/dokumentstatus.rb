class Oda::Dokumentstatus < ApplicationRecord
  include Synchronizable

  scope :alphabetical, -> { order(:status) }
end
