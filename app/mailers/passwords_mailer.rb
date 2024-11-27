class PasswordsMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail subject: "Nulstil dit kodeord", to: user.email_address
  end
end
