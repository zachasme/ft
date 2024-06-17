class Oda::DocumentsController < ApplicationController
  def index
    records = Oda::Dokument
      .chronological
      .includes(:kategori, :status, :type)

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
        dokument_aktørs: [ :aktør, :rolle ]
      )
      .find(params[:id])
  end
end
