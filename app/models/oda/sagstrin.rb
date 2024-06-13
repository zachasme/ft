class Oda::Sagstrin < Oda::ApplicationRecord
  belongs_to :sag
  belongs_to :status, class_name: "Oda::Sagstrinsstatus"
  belongs_to :type, class_name: "Oda::Sagstrinstype"

  has_one :afstemning
end
