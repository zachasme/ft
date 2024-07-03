class Oda::Dagsordenspunkt < ApplicationRecord
  include Synchronizable

  belongs_to :møde, class_name: "Oda::Møde"
end
