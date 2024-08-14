class Search < ApplicationRecord
  belongs_to :user

  after_create :trim_recent_searches

  scope :chronological, -> { order(updated_at: :desc) }

  def self.record(query)
    transaction do
      find_or_create_by(query: query).touch
    end
  end

  private
    def trim_recent_searches
      user.searches.excluding(user.searches.chronological.limit(10)).destroy_all
    end
end
