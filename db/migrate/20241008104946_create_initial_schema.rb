class CreateInitialSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.boolean :verified, default: false, null: false
      t.boolean :admin, default: false, null: false
      t.timestamps
    end

    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end

    create_table :search_agents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :query, null: false
      t.datetime :executed_at
      t.timestamps
    end

    create_table :searches do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
