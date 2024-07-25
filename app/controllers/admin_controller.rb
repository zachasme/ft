class AdminController < ApplicationController
  before_action :require_admin

  private
    def require_admin
      unless Current.user.admin?
        redirect_to "/"
      end
    end
end
