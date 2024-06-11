class PartiesController < ApplicationController
  def index
    @parties = Party.chronological
  end

  def show
    @party = Party.includes(:members).find(params[:id])
  end
end
