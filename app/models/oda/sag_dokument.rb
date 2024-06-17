class Oda::SagDokument < ApplicationRecord
  belongs_to :sag, class_name: "Oda::Sag"
  belongs_to :dokument, class_name: "Oda::Dokument"
end
