class AddScopeIndexes < ActiveRecord::Migration[8.0]
  def change
    add_index :oda_dokuments, :dato
    add_index :oda_sags,      :nummernumerisk
    add_index :oda_aktørs,    :opdateringsdato
    add_index :oda_mødes,     :dato
    add_index :oda_periodes,  :kode
    add_index :oda_emneords,  :emneord_sags_count
  end
end
