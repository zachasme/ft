class Oda::ImportsController < ApplicationController
  def show
  end

  def create
    IO.copy_stream(params[:backup].tempfile, "storage/oda.sqlite3")
    redirect_to oda_import_url
  end
end
