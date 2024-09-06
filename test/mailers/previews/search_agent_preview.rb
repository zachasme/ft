class SearchAgentPreview < ActionMailer::Preview
  def notify
    search_agent = SearchAgent.first
    cases = search_agent.search
    SearchAgentMailer.with(search_agent:, cases:).notify
  end
end
