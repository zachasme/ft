class Oda::Møde < ApplicationRecord
  belongs_to :type, class_name: "Oda::Mødetype"
  belongs_to :status, class_name: "Oda::Mødestatus"
  belongs_to :periode, class_name: "Oda::Periode"

  has_many :møde_aktørs, class_name: "Oda::MødeAktør"
  has_many :dagsordenspunkts

  scope :chronological, -> { order(dato: :desc) }
end
