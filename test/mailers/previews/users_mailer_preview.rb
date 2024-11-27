# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/reset
  def verify_email_address
    UsersMailer.verify_email_address(User.take)
  end
end
