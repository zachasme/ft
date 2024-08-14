class User < ApplicationRecord
  has_many :search_agents, dependent: :destroy
  has_many :searches, dependent: :destroy

  # -- email address changeable

  normalizes :email_address, with: -> { _1.strip.downcase }

  validates :email_address, uniqueness: true

  generates_token_for :email_address_change, expires_in: 15.minutes do
    email_address
  end

  def email_address_change_token
    generate_token_for :email_address_change
  end
end
