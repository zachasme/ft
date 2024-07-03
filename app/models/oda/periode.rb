class Oda::Periode < ApplicationRecord
  include Synchronizable

  has_many :aktørs
  has_many :mødes
  has_many :sags

  scope :samlinger, -> { where(typenavn: "samling") }
  scope :chronological, -> { order(kode: :desc) }
end
