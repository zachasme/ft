class Oda::SagDokument < ApplicationRecord
  belongs_to :sag, class_name: "Oda::Sag"
  belongs_to :dokument, class_name: "Oda::Dokument"
  belongs_to :rolle, class_name: "Oda::SagDokumentRolle"
end
