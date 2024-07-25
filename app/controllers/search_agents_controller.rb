class SearchAgentsController < ApplicationController
  def index
    @search_agents = Current.user.search_agents
  end

  def show
    @search_agent = Current.user.search_agents.find(params[:id])

    @afstemninger = @search_agent.afstemninger.changed_since(@search_agent.executed_at).chronological.limit(10)
  end

  def new
    @search_agent = Current.user.search_agents.new
  end

  def create
    @search_agent = Current.user.search_agents.new(search_agent_params)
    if @search_agent.save
      redirect_to search_agents_url, notice: "Søgeagent oprettet"
    else
      flash.now[:alert] = "Noget gik galt"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @search_agent = Current.user.search_agents.find(params[:id])
  end

  def update
    @search_agent = Current.user.search_agents.find(params[:id])
    if @search_agent.update(search_agent_params)
      redirect_to @search_agent, notice: "Søgeagent opdateret"
    else
      flash.now[:alert] = "Noget gik galt"
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def search_agent_params
      params.require(:search_agent).permit(:name, :query)
    end
end
