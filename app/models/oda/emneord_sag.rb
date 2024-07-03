class Oda::EmneordSag < ApplicationRecord
  include Synchronizable

  belongs_to :sag, class_name: "Oda::Sag"
  belongs_to :emneord, class_name: "Oda::Emneord", counter_cache: true
end
