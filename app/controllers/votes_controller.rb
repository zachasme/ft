class VotesController < ApplicationController
  def index
    @votes = Vote.includes(:decision).limit(20)
  end
end
