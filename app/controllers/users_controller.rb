class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by(email_address: user_params[:email_address])
      redirect_to new_device_url, notice: "Du har allerede en bruger"
    elsif @user.save
      UserMailer.with(user: @user).verify_email_address.deliver_later
      start_new_session_for @user
      redirect_to root_url, notice: "Tjek din indbakke. Vi har sendt en mail til #{@user.email_address}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Current.user.destroy!
    reset_authentication
    redirect_to root_path, notice: "Din bruger er blevet slettet"
  end

  private
    def user_params
      params.require(:user).permit(:email_address, :password)
    end
end
