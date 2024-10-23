class PollsController < ApplicationController
  def index
    @recent_searches = Current.user&.searches&.chronological || []

    records = Oda::Afstemning
      .select("*")
      .joins(:sag)
      .merge(Oda::Sag.search(query).select_snippets)

    if params[:order] == "ranked"
      @order = :ranked
      records = records.merge(Oda::Sag.ranked)
    else
      @order = :chronological
      records = records.chronological
    end

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
