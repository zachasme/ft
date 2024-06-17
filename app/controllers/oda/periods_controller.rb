class Oda::PeriodsController < ApplicationController
  def index
    records = Oda::Periode
      .chronological

    set_page_and_extract_portion_from records
  end

  def show
    @periode = Oda::Periode.find(params[:id])
  end
end
