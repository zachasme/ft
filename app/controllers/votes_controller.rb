class VotesController < ApplicationController
  def index
    @votes = Vote.includes(:decision)
  end
end
