class UserMailer < ApplicationMailer
  def magic_link
    @user = params[:user]
    @url = device_url sid: @user.signed_id(purpose: :login, expires_in: 15.minutes)
    mail subject: "Log ind på ft.kfvs.dk", to: @user.email_address
  end

  def change_email_address
    @user = params[:user]
    mail subject: "Skift din email adresse på ft.kfvs.dk", to: @user.email_address
  end
end
