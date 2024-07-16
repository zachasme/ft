class Oda::CasesController < ApplicationController
  def index
    records = Oda::Sag
      .includes(:periode, :kategori, :status, :type, :deltundersag, :fremsatundersag)
      .chronological
      .matches(params[:search])

    @casetype_id = params.has_key?(:casetype_id) ? params[:casetype_id] : "3"
    records = records.casetype(@casetype_id) unless @casetype_id.empty?
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
      :emneord,
    ).find(params[:id])

    @sagstrin = @sag.sagstrin
      .includes(
        :status,
        :type,
        :afstemning,
        :dokumenter,
        :sambehandlinger_a_sager,
        :sambehandlinger_b_sager,
      )
      .chronological

    @sag_dokumenter = @sag.sag_dokumenter
      .includes(:dokument, :rolle)
      .order(:opdateringsdato)
  end
end
