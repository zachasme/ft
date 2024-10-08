class Oda::Sagstrin < Oda::OdaRecord
  include Synchronizable

  belongs_to :sag
  belongs_to :status, class_name: "Oda::Sagstrinsstatus"
  belongs_to :type, class_name: "Oda::Sagstrinstype"

  has_many :sambehandlinger_a,
    inverse_of: :førstesagstrin,
    class_name: "Oda::Sambehandlinger"
  has_many :sambehandlinger_b,
    inverse_of: :andetsagstrin,
    class_name: "Oda::Sambehandlinger"
  has_many :sambehandlinger_a_sagstrin,
    through: :sambehandlinger_a,
    source: :andetsagstrin
  has_many :sambehandlinger_b_sagstrin,
    through: :sambehandlinger_b,
    source: :førstesagstrin
  has_many :sambehandlinger_a_sager,
    through: :sambehandlinger_a_sagstrin,
    source: :sag
  has_many :sambehandlinger_b_sager,
    through: :sambehandlinger_b_sagstrin,
    source: :sag

  has_many :sagstrin_dokumenter
  has_many :dokumenter, through: :sagstrin_dokumenter

  has_one :afstemning

  scope :chronological, -> { order dato: :desc }

  def sambehandlinger
    sambehandlinger_a_sager + sambehandlinger_b_sager
  end
end
