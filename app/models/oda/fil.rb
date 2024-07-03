class Oda::Fil < ApplicationRecord
  include Synchronizable

  belongs_to :dokument, class_name: "Oda::Dokument"
end
