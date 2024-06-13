class Oda::ApplicationRecord <  ActiveRecord::Base
  primary_abstract_class
  connects_to database: { reading: :oda, writing: :oda }
end
