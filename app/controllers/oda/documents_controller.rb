class Oda::DocumnetsController < ApplicationController
  def show
    @dokument = Oda::Document
      .find(params[:id])
  end
end
