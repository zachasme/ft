class AdminController < ApplicationController
  before_action :authenticate

  private
    def authenticate
      http_basic_authenticate_or_request_with name: "admin", password: Rails.application.credentials.admin_password
    end
end
