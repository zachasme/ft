# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def magic_link
    user = User.find_or_create_by!(email_address: "test@test.dk")
    UserMailer.with(user:).magic_link
  end
end
