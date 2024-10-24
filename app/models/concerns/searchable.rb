module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, ->(query) do
      x = joins("join #{table_name + "_search_index"} idx on #{table_name}.id = idx.rowid")
      x = x.where("#{table_name + "_search_index"} match ?", query) if query.present?
      x
    end
    scope :ranked, -> { order(:rank) }

    after_create_commit  :create_in_search_index
    after_update_commit  :update_in_search_index
    after_destroy_commit :remove_from_search_index
  end

  class_methods do
    def has_searchables(*columns, **options)
      snippets = columns.map.with_index { |col, i| select_snippet(col, i, **options) }
      scope :select_snippets, -> {
        select(*snippets)
      }
    end

    def rebuild_search_index
      index_table_name = table_name + "_search_index"
      connection.execute "INSERT INTO #{index_table_name}(#{index_table_name}) VALUES('rebuild');"
    end

    private
      def select_snippet(column, i, tag: "mark", omission: "…")
        "snippet(#{table_name + "_search_index"}, #{i}, '<#{tag}>', '</#{tag}>', '#{omission}', 32) AS #{column}_snippet"
      end
  end

  private
    def create_in_search_index
      execute_sql_with_binds "insert into oda_sager_search_index(rowid, titel, titelkort, resume) values (?, ?, ?, ?)", id, titel, titelkort, resume
    end

    def update_in_search_index
      transaction do
        remove_from_search_index
        create_in_search_index
      end
    end

    def remove_from_search_index
      execute_sql_with_binds "insert into oda_sager_search_index(oda_sager_search_index, rowid, titel, titelkort, resume) values ('delete', ?, ?, ?, ?)", id_previously_was, titel_previously_was, titelkort_previously_was, resume_previously_was
    end

    def execute_sql_with_binds(*statement)
      self.class.connection.execute self.class.sanitize_sql(statement)
    end
end
