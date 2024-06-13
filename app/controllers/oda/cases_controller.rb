class Oda::CasesController < ApplicationController
  def index
    records = Oda::Sag
      .includes(:periode, :kategori, :status, :type, :deltundersag, :fremsatundersag)
      .chronological
      .matches(params[:search])

    records = records.casetype(params[:casetype_id]) if params[:casetype_id].present?
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
