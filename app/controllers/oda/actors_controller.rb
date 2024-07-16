class Oda::ActorsController < ApplicationController
  def index
    records = Oda::Aktør
      .includes(:type, :periode)
      .alphabetical
      .matches(params[:search])

    @actortype_id = params.has_key?(:actortype_id) ? params[:actortype_id] : "5"
    records = records.actortype(@actortype_id) unless @actortype_id.empty?
    set_page_and_extract_portion_from records
  end

  def show
    @aktør = Oda::Aktør
      .includes(fra_aktør_aktører: [ :rolle, :tilaktør ], til_aktør_aktører: [ :rolle, :fraaktør ])
      .find(params[:id])

    votes = @aktør.stemmer.includes(:type, afstemning: :sag).chronological
    set_page_and_extract_portion_from votes
  end
end
