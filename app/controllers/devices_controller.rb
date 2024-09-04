class DevicesController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_by(
      email_address: params[:email_address],
      password: params[:password]
    )
      start_new_session_for user
      redirect_to root_path, notice: "Velkommen tilbage!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_authentication
    redirect_to root_path, notice: "Du er logget ud"
  end
end
