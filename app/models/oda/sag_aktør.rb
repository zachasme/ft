class Oda::SagAktør < ApplicationRecord
  include Synchronizable

  belongs_to :sag, class_name: "Oda::Sag"
  belongs_to :aktør, class_name: "Oda::Aktør"
end
