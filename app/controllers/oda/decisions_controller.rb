class Oda::DecisionsController < ApplicationController
  def index
    records = Oda::Afstemning
      .includes(:sagstrin, :sag, :type)
      .chronological
      .matches(params[:search])
    set_page_and_extract_portion_from records
  end

  def show
    @afstemning = Oda::Afstemning.includes(:sag, stemmes: [ :aktør, :type ]).find(params[:id])
  end
end
