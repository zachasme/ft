class SearchAgentJob < ApplicationJob
  def perform(search_agent)
    search_agent.transaction do
      cases = search_agent.search
      if cases.present?
        SearchAgentMailer.with(search_agent:).notify(*cases).deliver_later
      end

      search_agent.update! executed_at: Time.current
    end
  end
end
