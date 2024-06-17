class Oda::Periode < ApplicationRecord
  has_many :aktørs
  has_many :mødes
  has_many :sags

  scope :chronological, -> { order(kode: :desc) }
end
