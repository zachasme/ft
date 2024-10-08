class Oda::MødeAktør < Oda::OdaRecord
  include Synchronizable

  belongs_to :møde, class_name: "Oda::Møde"
  belongs_to :aktør, class_name: "Oda::Aktør"
end
