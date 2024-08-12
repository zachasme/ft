class AdminController < ApplicationController
  before_action :require_admin

  private
    def require_admin
      unless Rails.env.development? || Current.user.admin?
        redirect_to "/"
      end
    end
end
