class Oda::EmneordSag < ApplicationRecord
  belongs_to :sag, class_name: "Oda::Sag"
  belongs_to :emneord, class_name: "Oda::Emneord"
end
