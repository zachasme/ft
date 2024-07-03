class Oda::AktørAktørRolle < ApplicationRecord
  include Synchronizable

  has_many :aktør_aktørs, inverse_of: :rolle
end
