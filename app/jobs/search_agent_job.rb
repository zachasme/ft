class SearchAgentJob < ApplicationJob
  def perform(search_agent)
    search_agent.transaction do
      changed = search_agent.afstemninger.changed_since(search_agent.executed_at)
      puts changed

      search_agent.update! executed_at: Time.current
    end
  end
end
