class Oda::PeriodsController < Oda::ApplicationController
  def index
    records = Oda::Periode
      .chronological

    set_page_and_extract_portion_from records
  end

  def show
    @periode = Oda::Periode.find(params[:id])
    @aktører = @periode.aktører.chronological
    @sager = @periode.sager.chronological
    @møder = @periode.møder.chronological
  end
end
