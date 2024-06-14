class Oda::AktørAktør < ApplicationRecord
  belongs_to :rolle, class_name: "Oda::AktørAktørRolle"
  belongs_to :fraaktør, class_name: "Oda::Aktør"
  belongs_to :tilaktør, class_name: "Oda::Aktør"
end
