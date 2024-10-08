class Oda::EmneordDokument < Oda::OdaRecord
  include Synchronizable

  belongs_to :dokument, class_name: "Oda::Dokument"
  belongs_to :emneord, class_name: "Oda::Emneord", counter_cache: true
end
