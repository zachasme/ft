class Oda::Møde < ApplicationRecord
  scope :chronological, -> { order(:opdateringsdato) }
end
