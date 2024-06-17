class Oda::MeetingsController < ApplicationController
  def index
    records = Oda::Møde
      .includes(:status, :type)
      .chronological

    set_page_and_extract_portion_from records
  end

  def show
    @møde = Oda::Møde
      .includes(
        :type,
        :status,
        :periode,
        møde_aktørs: :aktør
      )
      .find(params[:id])
  end
end
