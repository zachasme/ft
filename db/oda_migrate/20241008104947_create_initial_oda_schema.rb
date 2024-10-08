class CreateInitialOdaSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :oda_afstemninger do |t|
      t.string :kommentar
      t.string :konklusion
      t.references :møde
      t.integer :nummer
      t.datetime :opdateringsdato, index: true
      t.references :sagstrin
      t.references :type
      t.boolean :vedtaget
    end

    create_table :oda_afstemningstyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_table :oda_aktør_aktør_roller do |t|
      t.datetime :opdateringsdato, index: true
      t.string :rolle
    end

    create_table :oda_aktør_aktører do |t|
      t.references :fraaktør
      t.datetime :opdateringsdato, index: true
      t.references :rolle
      t.datetime :slutdato
      t.datetime :startdato
      t.references :tilaktør
    end

    create_table :oda_aktører do |t|
      t.string :biografi
      t.string :efternavn
      t.string :fornavn
      t.string :gruppenavnkort
      t.string :navn, index: true
      t.datetime :opdateringsdato, index: true
      t.references :periode
      t.datetime :slutdato
      t.datetime :startdato
      t.references :type
    end

    create_table :oda_aktørtyper do |t|
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_dagsordenspunkt_dokumenter do |t|
      t.references :dagsordenspunkt
      t.references :dokument
      t.string :note
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dagsordenspunkt_sager do |t|
      t.references :dagsordenspunkt
      t.datetime :opdateringsdato, index: true
      t.references :sag
    end

    create_table :oda_dagsordenspunkter do |t|
      t.string :forhandling
      t.string :forhandlingskode
      t.string :kommentar
      t.string :kørebemærkning
      t.references :møde
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato, index: true
      t.references :sagstrin
      t.references :super
      t.string :titel
    end

    create_table :oda_dokument_aktør_roller do |t|
      t.datetime :opdateringsdato, index: true
      t.string :rolle
    end

    create_table :oda_dokument_aktører do |t|
      t.references :aktør
      t.references :dokument
      t.datetime :opdateringsdato, index: true
      t.references :rolle
    end

    create_table :oda_dokumenter do |t|
      t.integer :dagsordenudgavenummer
      t.datetime :dato, index: true
      t.datetime :frigivelsesdato
      t.string :grundnotatstatus
      t.references :kategori
      t.datetime :modtagelsesdato
      t.string :offentlighedskode
      t.datetime :opdateringsdato, index: true
      t.string :paragraf
      t.string :paragrafnummer
      t.string :procedurenummer
      t.references :spørgsmåls
      t.string :spørgsmålsordlyd
      t.string :spørgsmålstitel
      t.references :status
      t.string :titel, index: true
      t.references :type
    end

    create_table :oda_dokumentkategorier do |t|
      t.string :kategori
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokumentstatuser do |t|
      t.datetime :opdateringsdato, index: true
      t.string :status
    end

    create_table :oda_dokumenttyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_table :oda_emneord do |t|
      t.string :emneord, index: true
      t.datetime :opdateringsdato, index: true
      t.references :type
      t.integer :emneord_sager_count, default: 0, index: true
      t.integer :emneord_dokumenter_count, default: 0
    end

    create_table :oda_emneord_dokumenter do |t|
      t.references :dokument
      t.references :emneord
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_emneord_sager do |t|
      t.references :emneord
      t.datetime :opdateringsdato, index: true
      t.references :sag
    end

    create_table :oda_emneordstyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_table :oda_entitet_beskrivelser do |t|
      t.string :entitetnavn
      t.string :beskrivelse
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_filer do |t|
      t.references :dokument
      t.string :filurl
      t.string :format
      t.datetime :opdateringsdato, index: true
      t.string :titel
      t.string :variantkode
      t.datetime :versionsdato
    end

    create_table :oda_id_maps do |t|
      t.string :original_id
      t.string :entity
    end

    create_table :oda_kollone_beskrivelser do |t|
      t.string :entitetnavn
      t.string :kollonenavn
      t.string :beskrivelse
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_møde_aktører do |t|
      t.references :aktør
      t.references :møde
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_møder do |t|
      t.string :dagsordenurl
      t.datetime :dato, index: true
      t.string :lokale
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato, index: true
      t.references :periode
      t.string :starttidsbemærkning
      t.references :status
      t.string :titel
      t.references :type
    end

    create_table :oda_mødestatuser do |t|
      t.datetime :opdateringsdato, index: true
      t.string :status
    end

    create_table :oda_mødetyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_table :oda_omtryk do |t|
      t.string :begrundelse
      t.datetime :dato
      t.references :dokument
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_perioder do |t|
      t.string :kode, index: true
      t.datetime :opdateringsdato, index: true
      t.datetime :slutdato
      t.datetime :startdato
      t.string :titel
      t.string :typenavn
      t.integer :aktører_count, default: 0
      t.integer :møder_count, default: 0
      t.integer :sager_count, default: 0
    end

    create_table :oda_sag_aktør_roller do |t|
      t.datetime :opdateringsdato, index: true
      t.string :rolle
    end

    create_table :oda_sag_aktører do |t|
      t.references :aktør
      t.datetime :opdateringsdato, index: true
      t.references :rolle
      t.references :sag
    end

    create_table :oda_sag_dokument_roller do |t|
      t.datetime :opdateringsdato, index: true
      t.string :rolle
    end

    create_table :oda_sag_dokumenter do |t|
      t.string :bilagsnummer
      t.references :dokument
      t.datetime :frigivelsesdato
      t.datetime :opdateringsdato, index: true
      t.references :rolle
      t.references :sag
    end

    create_table :oda_sager do |t|
      t.string :afgørelse
      t.datetime :afgørelsesdato
      t.string :afgørelsesresultatkode
      t.string :afstemningskonklusion
      t.string :baggrundsmateriale
      t.string :begrundelse
      t.references :deltundersag
      t.references :fremsatundersag
      t.references :kategori
      t.string :lovnummer
      t.datetime :lovnummerdato
      t.string :nummer
      t.string :nummernumerisk, index: true
      t.string :nummerpostfix
      t.string :nummerprefix
      t.string :offentlighedskode
      t.datetime :opdateringsdato, index: true
      t.string :paragraf
      t.integer :paragrafnummer
      t.references :periode
      t.string :resume
      t.string :retsinformationsurl
      t.datetime :rådsmødedato
      t.boolean :statsbudgetsag
      t.references :status
      t.string :titel, index: true
      t.string :titelkort
      t.references :type
    end

    create_table :oda_sagskategorier do |t|
      t.string :kategori
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagsstatuser do |t|
      t.datetime :opdateringsdato, index: true
      t.string :status
    end

    create_table :oda_sagstrin do |t|
      t.datetime :dato
      t.string :folketingstidende
      t.string :folketingstidendesidenummer
      t.string :folketingstidendeurl
      t.datetime :opdateringsdato, index: true
      t.references :sag
      t.references :status
      t.string :titel
      t.references :type
    end

    create_table :oda_sagstrin_aktør_roller do |t|
      t.datetime :opdateringsdato, index: true
      t.string :rolle
    end

    create_table :oda_sagstrin_aktører do |t|
      t.references :aktør
      t.datetime :opdateringsdato, index: true
      t.references :rolle
      t.references :sagstrin
    end

    create_table :oda_sagstrin_dokumenter do |t|
      t.references :dokument
      t.datetime :opdateringsdato, index: true
      t.references :sagstrin
    end

    create_table :oda_sagstrinsstatuser do |t|
      t.datetime :opdateringsdato, index: true
      t.string :status
    end

    create_table :oda_sagstrinstyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_table :oda_sagstyper do |t|
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_sambehandlinger do |t|
      t.references :andetsagstrin
      t.references :førstesagstrin
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_slettet_maps do |t|
      t.string :datatype
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_slettets do |t|
      t.references :slettetmap
      t.datetime :opdateringsdato, index: true
      t.references :objekt
    end

    create_table :oda_stemmer do |t|
      t.references :afstemning
      t.references :aktør
      t.datetime :opdateringsdato, index: true
      t.references :type
    end

    create_table :oda_stemmetyper do |t|
      t.datetime :opdateringsdato, index: true
      t.string :typenavn
    end

    create_virtual_table :oda_sager_search_index, :fts5, [
      "titel",
      "titelkort",
      "resume",
      "content=oda_sager",
      "content_rowid=id"
    ]
  end
end
