class Oda::ApplicationRecord <  ActiveRecord::Base
  self.abstract_class = true

  connects_to database: { reading: :oda, writing: :oda }
end
