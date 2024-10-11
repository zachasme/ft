class WelcomeController < ApplicationController
  def show
    @latest = Oda::Afstemning.chronological.first(5)
  end
end
