class Oda::Sagstrin < ApplicationRecord
  include Synchronizable

  belongs_to :sag
  belongs_to :status, class_name: "Oda::Sagstrinsstatus"
  belongs_to :type, class_name: "Oda::Sagstrinstype"

  has_many :sambehandlingers_a,
    inverse_of: :førstesagstrin,
    class_name: "Oda::Sambehandlinger"
  has_many :sambehandlingers_b,
    inverse_of: :andetsagstrin,
    class_name: "Oda::Sambehandlinger"
  has_many :sambehandlingers_a_sagstrin,
    through: :sambehandlingers_a,
    source: :andetsagstrin
  has_many :sambehandlingers_b_sagstrin,
    through: :sambehandlingers_b,
    source: :førstesagstrin
  has_many :sambehandlingers_a_sags,
    through: :sambehandlingers_a_sagstrin,
    source: :sag
  has_many :sambehandlingers_b_sags,
    through: :sambehandlingers_b_sagstrin,
    source: :sag

  has_many :sagstrin_dokuments
  has_many :dokuments, through: :sagstrin_dokuments

  has_one :afstemning

  scope :chronological, -> { order dato: :desc }

  def sambehandlinger
    sambehandlingers_a_sags + sambehandlingers_b_sags
  end
end
