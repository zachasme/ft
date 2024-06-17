class Oda::EntityDescriptionsController < ApplicationController
  def index
    @records = Oda::KolloneBeskrivelse.all
  end
end
