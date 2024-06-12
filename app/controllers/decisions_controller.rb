class DecisionsController < ApplicationController
  def index
    set_page_and_extract_portion_from Decision.chronological.matches(params[:search])
  end

  def show
    @decision = Decision.includes(stage: :bill, votes: { voter: :parties }).find(params[:id])
  end
end
