class Oda::DokumentAktør < ApplicationRecord
  include Synchronizable

  belongs_to :dokument
  belongs_to :aktør
  belongs_to :rolle, class_name: "Oda::DokumentAktørRolle"
end
