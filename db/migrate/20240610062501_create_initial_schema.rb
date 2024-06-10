class CreateInitialSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.integer :ftid, index: { unique: true }
      t.string :name
      t.string :biography

      t.timestamps
    end

    create_table :parties do |t|
      t.integer :ftid, index: { unique: true }
      t.string :name
      t.string :abbreviation

      t.timestamps
    end

    create_table :memberships do |t|
      t.integer :ftid, index: { unique: true }
      t.references :person, index: true, foreign_key: true
      t.references :party, index: true, foreign_key: true
      t.string :name
      t.string :abbreviation

      t.timestamps
    end

    create_table :decisions do |t|
      t.integer :ftid, index: { unique: true }
      t.string :name
      t.string :comment
      t.boolean :passed
      t.integer :number

      t.string :casetype

      t.timestamps
    end

    create_table :votes do |t|
      t.integer :ftid, index: { unique: true }
      t.references :decision, index: true, foreign_key: true
      t.references :voter, index: true, foreign_key: { to_table: :people }
      t.integer :type

      t.timestamps
    end

    # sagstyper
  end
end
