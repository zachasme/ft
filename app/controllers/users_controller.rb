class UsersController < ApplicationController
  def destroy
    Current.user.destroy!
    reset_authentication
    redirect_to root_path, notice: "Din bruger er blevet slettet"
  end
end
