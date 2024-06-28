class AddCounterCaches < ActiveRecord::Migration[8.0]
  def change
    add_column :oda_emneords, :emneord_sags_count, :integer, default: 0
    add_column :oda_emneords, :emneord_dokuments_count, :integer, default: 0

    add_column :oda_periodes, :aktørs_count, :integer, default: 0
    add_column :oda_periodes, :mødes_count, :integer, default: 0
    add_column :oda_periodes, :sags_count, :integer, default: 0
  end
end
