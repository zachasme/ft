class Oda::Omtryk < ApplicationRecord
  include Synchronizable

  belongs_to :dokument
end
