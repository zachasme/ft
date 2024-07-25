# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def magic_link
    user = User.find_or_create_by!(email_address: "test@test.dk")
    url = "/enhed?sid=" + user.signed_id(purpose: :login, expires_in: 15.minutes)
    UserMailer.with(user:, url:).magic_link
  end
end
