class Oda::Dagsordenspunkt < Oda::OdaRecord
  include Synchronizable

  belongs_to :møde

  # it looks like `super_id` is not used properly
  belongs_to :super, class_name: "Oda::Dagsordenspunkt", optional: true
  belongs_to :sagstrin, optional: true
  has_many :children, class_name: "Oda::Dagsordenspunkt", foreign_key: :super_id
  scope :roots, -> { where(super_id: nil) }
end
