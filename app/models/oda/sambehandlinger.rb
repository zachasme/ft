class Oda::Sambehandlinger < ApplicationRecord
  include Synchronizable

  belongs_to :førstesagstrin, class_name: "Oda::Sagstrin"
  belongs_to :andetsagstrin, class_name: "Oda::Sagstrin"
end
