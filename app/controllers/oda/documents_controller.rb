class Oda::DocumentsController < ApplicationController
  def show
    @dokument = Oda::Document
      .find(params[:id])
  end
end
