class CreateSearchAgent < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.boolean :verified,     null: false
      t.boolean :admin,        null: false

      t.timestamps
    end

    create_table :search_agents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name,     null: false
      t.string :query,    null: false
      t.datetime :executed_at

      t.timestamps
    end
  end
end
