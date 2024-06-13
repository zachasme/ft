class Oda::CasesController < ApplicationController
  def index
    records = Oda::Sag
      .includes(:periode, :kategori, :status, :type, :deltundersag, :fremsatundersag)
      .chronological
      .matches(params[:search])
    set_page_and_extract_portion_from records
  end

  def show
    @sag = Oda::Sag.includes(
      :periode,
      :kategori,
      :status,
      :type,
      :deltundersag,
      :fremsatundersag,
      sagstrin: [ :status, :type, :afstemning ]
    ).find(params[:id])
  end
end
