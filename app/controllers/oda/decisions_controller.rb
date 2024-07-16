class Oda::DecisionsController < ApplicationController
  def index
    records = Oda::Afstemning
      .includes(:sagstrin, :sag, :type, :periode)
      .chronological
      .matches(params[:search])

    default_period = Oda::Periode.samlinger.chronological.first.id
    @period_id = params.has_key?(:period_id) ? params[:period_id] : default_period.to_s
    records = records.with_period(@period_id) unless @period_id.empty?
    set_page_and_extract_portion_from records
  end

  def show
    @afstemning = Oda::Afstemning.includes(:sag, møde: :type, stemmer: [ :aktør, :type ]).find(params[:id])
  end
end
