class Oda::Dagsordenspunkt < ApplicationRecord
  belongs_to :møde, class_name: "Oda::Møde"
end
