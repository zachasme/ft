class Oda::DokumentAktør < ApplicationRecord
  belongs_to :dokument, class_name: "Oda::Dokument"
  belongs_to :aktør, class_name: "Oda::Aktør"
  belongs_to :rolle, class_name: "Oda::DokumentAktørRolle"
end
