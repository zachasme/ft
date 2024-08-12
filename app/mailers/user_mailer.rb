class UserMailer < ApplicationMailer
  def magic_link
    @user = params[:user]
    @url = "/enhed?sid=" + @user.signed_id(purpose: :login, expires_in: 15.minutes)
    @url = device_url sid: @user.signed_id(purpose: :login, expires_in: 15.minutes)
    mail(to: @user.email_address, subject: "Log ind på ft.kfvs.dk")
  end
end
