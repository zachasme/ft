class Oda::DeletionsController < ApplicationController
  def index
    records = Oda::Slettet
      .includes(:slettetmap)
      .chronological
    set_page_and_extract_portion_from records
  end
end
