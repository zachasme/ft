class SearchesController < ApplicationController
  def show
    @recent_searches = Current.user&.searches&.chronological || []

    records = Oda::Sag
      .includes(:periode, :kategori, :status, :type, :deltundersag, :fremsatundersag)
      .chronological
      .matches(query)

    @sagstyper = (params[:sagstyper]||[]).compact_blank.any? ? params[:sagstyper] : [ 3, 5, 9 ]
    records = records.casetype(@sagstyper) unless @sagstyper.empty?
    set_page_and_extract_portion_from records
  end

  def create
    Current.user.searches.record(query)
  ensure
    redirect_to search_url(q: query)
  end

  private
    def query
      params[:q]&.gsub(/[^[:word:]]/, " ")
    end
end
