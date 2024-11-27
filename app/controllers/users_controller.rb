class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by(email_address: user_params[:email_address])
      redirect_to new_session_url, notice: "Du har allerede en bruger"
    elsif @user.save
      UsersMailer.verify_email_address(@user).deliver_later
      start_new_session_for @user
      redirect_to root_url, notice: "Tjek din indbakke. Vi har sendt en mail til #{@user.email_address}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Current.user.destroy!
    terminate_session
    redirect_to root_path, notice: "Din bruger er blevet slettet"
  end

  private
    def user_params
      params.require(:user).permit(:email_address, :password)
    end
end
