class BillsController < ApplicationController
  def index
    set_page_and_extract_portion_from Bill.chronological
  end

  def show
    @bill = Bill.includes(stages: :decision).find(params[:id])
  end
end
