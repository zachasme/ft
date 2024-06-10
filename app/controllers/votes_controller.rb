class VotesController < ApplicationController
  def index
    base = case
    when params[:person_id]
      Person.find(params[:person_id])
    end
    @votes = base.votes
  end
end
