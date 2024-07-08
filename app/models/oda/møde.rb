class Oda::Møde < ApplicationRecord
  include Synchronizable

  belongs_to :periode, counter_cache: true
  belongs_to :type, class_name: "Oda::Mødetype"
  belongs_to :status, class_name: "Oda::Mødestatus"

  has_many :møde_aktørs
  has_many :dagsordenspunkts

  scope :chronological, -> { order(dato: :desc) }
end
