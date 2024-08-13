class EmailAddressesController < ApplicationController
  def new
  end

  def create
    UserMailer.with(user: Current.user).change_email_address.deliver_later
  end

  def edit
  end
end
