class MoreOda < ActiveRecord::Migration[8.0]
  def change
    create_table :oda_aktør_aktør_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end
  end
end
