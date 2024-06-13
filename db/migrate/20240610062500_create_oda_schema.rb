class CreateOdaSchema < ActiveRecord::Migration[8.0]
  def change
    # Relationer
    create_table :oda_periodes do |t|
      # t.integer :id
      t.string :kode
      t.datetime :opdateringsdato
      t.datetime :slutdato
      t.datetime :startdato
      t.string :titel
      t.string :typenavn
    end

    # Aktør
    create_table :oda_aktørtypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_aktørs do |t|
      t.string :biografi
      t.string :efternavn
      t.string :fornavn
      t.string :gruppenavnkort
      # t.integer :id
      t.string :navn
      t.datetime :opdateringsdato
      t.references :periode
      t.datetime :slutdato
      t.datetime :startdato
      t.references :type
    end

    create_table :oda_aktør_aktørs do |t|
      t.references :fraaktør
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :rolle
      t.datetime :slutdato
      t.datetime :startdato
      t.references :tilaktør
    end

    # Sag
    create_table :oda_sagskategoris do |t|
      # t.integer :id
      t.string :kategori
      t.datetime :opdateringsdato
    end

    create_table :oda_sagsstatuses do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :status
    end

    create_table :oda_sagstypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_sags do |t|
      t.string :afgørelse
      t.datetime :afgørelsesdato
      t.string :afgørelsesresultatkode
      t.string :afstemningskonklusion
      t.string :baggrundsmateriale
      t.string :begrundelse
      t.references :deltundersag
      t.references :fremsatundersag
      # t.integer :id
      t.references :kategori
      t.string :lovnummer
      t.datetime :lovnummerdato
      t.string :nummer
      t.string :nummernumerisk
      t.string :nummerpostfix
      t.string :nummerprefix
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.string :paragraf
      t.integer :paragrafnummer
      t.references :periode
      t.string :resume
      t.string :retsinformationsurl
      t.datetime :rådsmødedato
      t.boolean :statsbudgetsag
      t.references :status
      t.string :titel
      t.string :titelkort
      t.references :type
    end

    # Sagstrin
    create_table :oda_sagstrins do |t|
      t.datetime :dato
      t.string :folketingstidende
      t.string :folketingstidendesidenummer
      t.string :folketingstidendeurl
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :sag
      t.references :status
      t.string :titel
      t.references :type
    end

    create_table :oda_sagstrinsstatuses do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :status
    end

    create_table :oda_sagstrinstypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    # Møde ---------------------------------------------------
    create_table :oda_mødestatuses do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :status
    end

    create_table :oda_mødetypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_mødes do |t|
      t.string :dagsordenurl
      t.datetime :dato
      # t.integer :id
      t.string :lokale
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.references :periode
      t.string :starttidsbemærkning
      t.references :status
      t.string :titel
      t.references :type
    end

    create_table :oda_afstemningstypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_afstemnings do |t|
      # t.integer :id
      t.string :kommentar
      t.string :konklusion
      t.references :møde
      t.integer :nummer
      t.datetime :opdateringsdato
      t.references :sagstrin
      t.references :type
      t.boolean :vedtaget
    end

    create_table :oda_stemmetypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_stemmes do |t|
      t.references :afstemning
      t.references :aktør
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :type
    end
  end
end
