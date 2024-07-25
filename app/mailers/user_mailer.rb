class UserMailer < ApplicationMailer
  def magic_link
    @email_address = params[:email_address]
    @url  = params[:url]
    mail(to: @email_address, subject: "Log ind på ft.kfvs.dk")
  end
end
