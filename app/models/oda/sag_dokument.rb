class Oda::SagDokument < Oda::OdaRecord
  include Synchronizable

  belongs_to :sag
  belongs_to :dokument
  belongs_to :rolle, class_name: "Oda::SagDokumentRolle"
end
