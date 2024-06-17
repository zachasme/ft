class Oda::DescriptionsController < ApplicationController
  def index
    @beskrivelser = Oda::KolloneBeskrivelse.order(:entitetnavn, :kolonnenavn).all
  end
end
