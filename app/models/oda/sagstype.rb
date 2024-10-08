class Oda::Sagstype < Oda::OdaRecord
  include Synchronizable

  scope :top, -> { where(id: [ 3, 5, 9 ]) }
  scope :bottom, -> { where.not(id: [ 3, 5, 9 ]) }
end
