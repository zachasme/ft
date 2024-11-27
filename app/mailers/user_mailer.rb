class UserMailer < ApplicationMailer
  def verify_email_address(user)
    @user = user
    @url = email_address_verification_url @user.signed_id(purpose: :verify_email_address, expires_in: 15.minutes)
    mail subject: "Log ind på ft.chari.as", to: @user.email_address
  end
end
