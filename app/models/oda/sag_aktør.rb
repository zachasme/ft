class Oda::SagAktør < ApplicationRecord
  include Synchronizable

  belongs_to :sag
  belongs_to :aktør
end
