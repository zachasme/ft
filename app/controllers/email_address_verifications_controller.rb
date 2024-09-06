class EmailAddressVerificationsController < ApplicationController
  def show
    @user = User.find_signed(params[:id], purpose: :verify_email_address)
  end

  def update
    @user = User.find_signed(params[:id], purpose: :verify_email_address)
    @user.verify
    start_new_session_for @user
    redirect_to root_url, notice: "Din e-mailadresse er blevet bekræftet"
  end
end
