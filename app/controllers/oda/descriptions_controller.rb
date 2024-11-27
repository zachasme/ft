class Oda::DescriptionsController < Oda::ApplicationController
  def index
    @entities = Oda::EntitetBeskrivelse.order(:id).all
    @columns = Oda::KolloneBeskrivelse.order(:entitetnavn, :kollonenavn).all
  end
end
