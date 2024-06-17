class Oda::DescriptionsController < ApplicationController
  def index
    @beskrivelser = Oda::KolloneBeskrivelse.order(:entitetnavn, :kollonenavn).all
  end
end
