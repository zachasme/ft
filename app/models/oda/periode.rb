class Oda::Periode < Oda::OdaRecord
  include Synchronizable

  has_many :aktører
  has_many :møder
  has_many :sager

  scope :samlinger, -> { where(typenavn: "samling") }
  scope :chronological, -> { order(kode: :desc) }
end
