class Oda::SubjectsController < ApplicationController
  def index
    records = Oda::Emneord
      .by_emneord_sags_count
      .matches(params[:search])

    set_page_and_extract_portion_from records
  end

  def show
    @emneord = Oda::Emneord
      .includes(:sags, :dokuments)
      .find(params[:id])
  end
end
