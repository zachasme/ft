class Oda::OdaRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :oda, reading: :oda }
end
