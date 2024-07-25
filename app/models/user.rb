class User < ApplicationRecord
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :search_agents
end
