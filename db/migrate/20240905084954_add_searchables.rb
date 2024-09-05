class AddSearchables < ActiveRecord::Migration[8.0]
  def change
    create_virtual_table :oda_sager_search_index, :fts5, [
      "titel",
      "titelkort",
      "resume",
      "content=oda_sager",
      "content_rowid=id"
    ]
  end
end
