class Oda::AktørAktørRolle < ApplicationRecord
  has_many :aktør_aktørs, inverse_of: :rolle
end
