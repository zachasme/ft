class Oda::AktørAktørRolle < Oda::OdaRecord
  include Synchronizable

  has_many :aktør_aktører, inverse_of: :rolle
end
