class Oda::Fil < ApplicationRecord
  belongs_to :dokument, class_name: "Oda::Dokument"
end
