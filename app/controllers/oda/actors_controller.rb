class Oda::ActorsController < ApplicationController
  def index
    @aktørs = Oda::Aktør.includes(:type).all
  end

  def show
    @aktør = Oda::Aktør.find(params[:id])

    votes = @aktør.stemmes.includes(:type, afstemning: :sag).chronological
    set_page_and_extract_portion_from votes
  end
end
