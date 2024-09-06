# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def verify_email_address
    user = User.first
    UserMailer.with(user:).verify_email_address
  end
end
