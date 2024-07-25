class DevicesController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by!(email_address: params[:email_address])
    url = device_url sid: user.signed_id(purpose: :login, expires_in: 15.minutes)

    UserMailer.with(user:, url:).magic_link.deliver_later

    redirect_to new_device_path, notice: "Check your inbox"
  end

  def show
    user = User.find_signed!(params[:sid], purpose: :login)
    user.update! verified: true
    start_new_session_for user
    redirect_after_authentication notice: "Du er logget ind!"
  end

  def destroy
    reset_authentication
    redirect_to root_path, notice: "Du er logget ud"
  end
end
