class Oda::SubjectsController < Oda::ApplicationController
  def index
    records = Oda::Emneord
      .by_emneord_sager_count
      .includes(:type)
      .matches(params[:search])

    @subjecttype_id = params.has_key?(:subjecttype_id) ? params[:subjecttype_id] : "1"
    records = records.subjecttype(@subjecttype_id) unless @subjecttype_id.empty?

    set_page_and_extract_portion_from records
  end

  def show
    @emneord = Oda::Emneord
      .includes(:sager, :dokumenter)
      .find(params[:id])
  end
end
