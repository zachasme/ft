class SearchAgentMailer < ApplicationMailer
  def notify(*cases)
    @search_agent = params[:search_agent]
    @cases = cases
    mail subject: "Nye sager i folketinget matcher din søgeagent", to: @search_agent.user.email_address
  end
end
