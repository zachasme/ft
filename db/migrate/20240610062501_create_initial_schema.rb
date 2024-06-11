class CreateInitialSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.string :name
      t.string :biography

      t.timestamps
    end

    create_table :parties do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.string :name
      t.string :abbreviation

      t.date :started_at
      t.date :ended_at
      t.timestamps
    end

    create_table :memberships do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.references :person, foreign_key: true
      t.references :party, foreign_key: true
      t.string :name
      t.string :abbreviation

      t.timestamps
    end

    create_table :decisions do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.string :name, null: false
      t.string :comment
      t.boolean :passed, null: false
      t.integer :number, null: false

      t.string :casetype, null: false

      t.timestamps
    end

    create_table :votes do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.references :decision, foreign_key: true
      t.references :voter, foreign_key: { to_table: :people }
      t.integer :what, null: false

      t.timestamps
    end

    create_table :cases do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.string :name
      t.string :resume

      t.timestamps
    end

    create_table :stages do |t|
      t.integer :ftid, index: { unique: true }
      t.date :ftts, null: false

      t.references :decision, null: true, foreign_key: true
      t.references :case, foreign_key: true
      t.string :name # enum?
      t.string :status # enum?

      t.timestamps
    end
  end
end
