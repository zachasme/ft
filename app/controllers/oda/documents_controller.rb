class Oda::DocumentsController < Oda::ApplicationController
  def index
    records = Oda::Dokument
      .chronological
      .includes(:kategori, :status, :type)
      .matches(params[:search])

    records = records.reprinted if params[:reprinted].present?

    @category_id = params.has_key?(:category_id) ? params[:category_id] : ""
    @status_id = params.has_key?(:status_id) ? params[:status_id] : ""
    @type_id = params.has_key?(:type_id) ? params[:type_id] : ""
    records = records.with_category(@category_id) unless @category_id.empty?
    records = records.with_status(@status_id) unless @status_id.empty?
    records = records.with_type(@type_id) unless @type_id.empty?

    set_page_and_extract_portion_from records
  end

  def show
    @dokument = Oda::Dokument
      .includes(
        :sager,
        :status,
        :type,
        :kategori,
        :filer,
        :sagstrin,
        :emneord,
        :omtryk,
        dokument_aktører: [ :aktør, :rolle ]
      )
      .find(params[:id])
  end
end
