class BrowsersController < ApplicationController
  def show
  end

  def edit
    SynchronizationJob.perform_now
    redirect_to browser_path
  end
end
