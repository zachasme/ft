class SearchAgent < ApplicationRecord
  attribute :executed_at, default: -> { Time.current }

  belongs_to :user

  def search
    Oda::Sag
      .includes(:periode, :kategori, :status, :type, :deltundersag, :fremsatundersag)
      .search(query)
      .ranked
      .with_snippets
      .casetype([ 3, 5, 9 ])
      .changed_since(executed_at)
  end
end
