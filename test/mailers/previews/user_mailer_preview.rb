# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def verify_email_address
    UserMailer.verify_email_address(User.take)
  end
end
