class CreateOdaSchema < ActiveRecord::Migration[8.0]
  def change
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

    create_table :oda_afstemningstypes do |t|
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

    create_table :oda_aktør_aktør_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end

    create_table :oda_aktørtypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_dagsordenspunkts do |t|
      t.string :forhandling
      t.string :forhandlingskode
      # t.integer :id
      t.string :kommentar
      t.string :kørebemærkning
      t.references :møde
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.references :sagstrin
      t.references :super
      t.string :titel
    end

    create_table :oda_dagsordenspunkt_dokuments do |t|
      t.references :dagsordenspunkt
      t.references :dokument
      # t.integer :id
      t.string :note
      t.datetime :opdateringsdato
    end

    create_table :oda_dagsordenspunkt_sags do |t|
      t.references :dagsordenspunkt
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :sag
    end

    create_table :oda_dokuments do |t|
      t.integer :dagsordenudgavenummer
      t.datetime :dato
      t.datetime :frigivelsesdato
      t.string :grundnotatstatus
      # t.integer :id
      t.references :kategori
      t.datetime :modtagelsesdato
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.string :paragraf
      t.string :paragrafnummer
      t.string :procedurenummer
      t.references :spørgsmåls
      t.string :spørgsmålsordlyd
      t.string :spørgsmålstitel
      t.references :status
      t.string :titel
      t.references :type
    end

    create_table :oda_dokument_aktørs do |t|
      t.references :aktør
      t.references :dokument
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :rolle
    end

    create_table :oda_dokument_aktør_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end

    create_table :oda_dokumentkategoris do |t|
      # t.integer :id
      t.string :kategori
      t.datetime :opdateringsdato
    end

    create_table :oda_dokumentstatuses do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :status
    end

    create_table :oda_dokumenttypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_emneords do |t|
      t.string :emneord
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :type
    end

    create_table :oda_emneord_dokuments do |t|
      t.references :dokument
      t.references :emneord
      # t.integer :id
      t.datetime :opdateringsdato
    end

    create_table :oda_emneord_sags do |t|
      t.references :emneord
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :sag
    end

    create_table :oda_emneordstypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_entitet_beskrivelses do |t|
      # t.integer :id
      t.string :entitetnavn
      t.string :beskrivelse
      t.datetime :opdateringsdato
    end

    create_table :oda_fils do |t|
      t.references :dokument
      t.string :filurl
      t.string :format
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :titel
      t.string :variantkode
      t.datetime :versionsdato
    end

    create_table :oda_id_maps do |t|
      # t.integer :id
      t.string :original_id
      t.string :entity
    end

    create_table :oda_kolonne_beskrivelses do |t|
      # t.integer :id
      t.string :entitetsnavn
      t.string :kolonnenavn
      t.string :beskrivelse
      t.datetime :opdateringsdato
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

    create_table :oda_møde_aktørs do |t|
      t.references :aktør
      # t.integer :id
      t.references :møde
      t.datetime :opdateringsdato
    end

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

    create_table :oda_omtryks do |t|
      t.string :begrundelse
      t.datetime :dato
      t.references :dokument
      # t.integer :id
      t.datetime :opdateringsdato
    end

    create_table :oda_periodes do |t|
      # t.integer :id
      t.string :kode
      t.datetime :opdateringsdato
      t.datetime :slutdato
      t.datetime :startdato
      t.string :titel
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

    create_table :oda_sag_aktørs do |t|
      t.references :aktør
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :rolle
      t.references :sag
    end

    create_table :oda_sag_aktør_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end

    create_table :oda_sag_dokuments do |t|
      t.string :bilagsnummer
      t.references :dokument
      t.datetime :frigivelsesdato
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :rolle
      t.references :sag
    end

    create_table :oda_sag_dokument_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end

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

    create_table :oda_sagstrin_aktørs do |t|
      t.references :aktør
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :rolle
      t.references :sagstrin
    end

    create_table :oda_sagstrin_aktør_rolles do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :rolle
    end

    create_table :oda_sagstrin_dokuments do |t|
      t.references :dokument
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :sagstrin
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

    create_table :oda_sagstypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_sambehandlingers do |t|
      t.references :andetsagstrin
      t.references :førstesagstrin
      # t.integer :id
      t.datetime :opdateringsdato
    end

    create_table :oda_slettets do |t|
      # t.integer :id
      t.references :slettetmap
      t.datetime :opdateringsdato
      t.string :objekt_id
    end

    create_table :oda_slettet_maps do |t|
      # t.integer :id
      t.string :datatype
      t.datetime :opdateringsdato
    end

    create_table :oda_stemmes do |t|
      t.references :afstemning
      t.references :aktør
      # t.integer :id
      t.datetime :opdateringsdato
      t.references :type
    end

    create_table :oda_stemmetypes do |t|
      # t.integer :id
      t.datetime :opdateringsdato
      t.string :typenavn
    end
  end
end
