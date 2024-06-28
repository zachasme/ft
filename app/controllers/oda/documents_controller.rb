class Oda::DocumentsController < ApplicationController
  def index
    records = Oda::Dokument
      .chronological
      .includes(:kategori, :status, :type)
      .matches(params[:search])

    records = records.reprinted if params[:reprinted].present?

    set_page_and_extract_portion_from records
  end

  def show
    @dokument = Oda::Dokument
      .includes(
        :sags,
        :status,
        :type,
        :kategori,
        :fils,
        :sagstrin,
        :emneords,
        :omtryks,
        dokument_aktørs: [ :aktør, :rolle ]
      )
      .find(params[:id])
  end
end
