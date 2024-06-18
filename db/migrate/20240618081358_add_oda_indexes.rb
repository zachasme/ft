class AddOdaIndexes < ActiveRecord::Migration[8.0]
  def change
    change_column :oda_sags, :titel, :string, collation: :nocase
    change_column :oda_aktørs, :navn, :string, collation: :nocase
    change_column :oda_dokuments, :titel, :string, collation: :nocase
    change_column :oda_emneords, :emneord, :string, collation: :nocase

    add_index :oda_sags, :titel
    add_index :oda_aktørs, :navn
    add_index :oda_dokuments, :titel
    add_index :oda_emneords, :emneord
  end
end
