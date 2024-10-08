class Oda::SagstrinDokument < Oda::OdaRecord
  include Synchronizable

  belongs_to :sagstrin, class_name: "Oda::Sagstrin"
  belongs_to :dokument, class_name: "Oda::Dokument"
end
