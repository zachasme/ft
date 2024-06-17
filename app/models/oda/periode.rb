class Oda::Periode < ApplicationRecord
  scope :chronological, -> { order(kode: :desc) }
end
