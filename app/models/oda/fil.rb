class Oda::Fil < Oda::OdaRecord
  include Synchronizable

  belongs_to :dokument, class_name: "Oda::Dokument"
end
