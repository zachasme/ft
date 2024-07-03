class Oda::EmneordDokument < ApplicationRecord
  include Synchronizable

  belongs_to :dokument, class_name: "Oda::Dokument"
  belongs_to :emneord, class_name: "Oda::Emneord", counter_cache: true
end
