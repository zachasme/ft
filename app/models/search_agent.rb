class SearchAgent < ApplicationRecord
  attribute :executed_at, default: -> { Time.current }

  belongs_to :user

  def afstemninger
    Oda::Afstemning.matches(query)
  end
end
