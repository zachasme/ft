class Oda::AktørAktørRolle < ApplicationRecord
  include Synchronizable

  has_many :aktør_aktører, inverse_of: :rolle
end
