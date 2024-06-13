class Oda::Aktør < ApplicationRecord
  has_many :stemmes
  has_many :afstemnings, through: :stemmes

  belongs_to :type, class_name: "Oda::Aktørtype"
end
