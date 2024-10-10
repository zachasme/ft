class CreateInitialOdaSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :oda_perioder do |t|
      t.string :kode, index: true
      t.datetime :slutdato
      t.datetime :startdato
      t.string :titel
      t.string :typenavn
      t.integer :aktører_count, default: 0
      t.integer :møder_count,   default: 0
      t.integer :sager_count,   default: 0
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_mødestatuser do |t|
      t.string :status
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_mødetyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_møder do |t|
      t.string :dagsordenurl
      t.datetime :dato, index: true
      t.string :lokale
      t.string :nummer
      t.string :offentlighedskode
      t.string :starttidsbemærkning
      t.string :titel
      t.references :periode, null: false, foreign_key: { to_table: :oda_perioder }
      t.references :status,  null: false, foreign_key: { to_table: :oda_mødestatuser }
      t.references :type,    null: false, foreign_key: { to_table: :oda_mødetyper }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagskategorier do |t|
      t.string :kategori
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagsstatuser do |t|
      t.string :status
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato
    end

    create_table :oda_sager do |t|
      t.string :afgørelse
      t.datetime :afgørelsesdato
      t.string :afgørelsesresultatkode
      t.string :afstemningskonklusion
      t.string :baggrundsmateriale
      t.string :begrundelse
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
      t.string :resume
      t.string :retsinformationsurl
      t.datetime :rådsmødedato
      t.boolean :statsbudgetsag
      t.string :titel, index: true
      t.string :titelkort
      t.references :deltundersag,    null: true   # self-referential
      t.references :fremsatundersag, null: true   # self-referential
      t.references :kategori,        null: true,  foreign_key: { to_table: :oda_sagskategorier }
      t.references :periode,         null: false, foreign_key: { to_table: :oda_perioder }
      t.references :status,          null: false, foreign_key: { to_table: :oda_sagsstatuser }
      t.references :type,            null: false, foreign_key: { to_table: :oda_sagstyper }
    end
    add_foreign_key :oda_sager, :oda_sager, column: :deltundersag_id, deferrable: :deferred
    add_foreign_key :oda_sager, :oda_sager, column: :fremsatundersag_id, deferrable: :deferred

    create_table :oda_sagstrinstyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstrinsstatuser do |t|
      t.string :status
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstrin do |t|
      t.datetime :dato
      t.string :folketingstidende
      t.string :folketingstidendesidenummer
      t.string :folketingstidendeurl
      t.string :titel
      t.references :sag,    null: false, foreign_key: { to_table: :oda_sager }
      t.references :status, null: false, foreign_key: { to_table: :oda_sagstrinsstatuser }
      t.references :type,   null: false, foreign_key: { to_table: :oda_sagstrinstyper }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_afstemningstyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_afstemninger do |t|
      t.string :kommentar
      t.string :konklusion
      t.integer :nummer
      t.boolean :vedtaget
      t.references :møde,     null: false, foreign_key: { to_table: :oda_møder }
      t.references :sagstrin, null: true, foreign_key: { to_table: :oda_sagstrin }
      t.references :type,     null: false, foreign_key: { to_table: :oda_afstemningstyper }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_aktør_aktør_roller do |t|
      t.string :rolle
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_aktør_aktører do |t|
      t.datetime :slutdato
      t.datetime :startdato
      t.references :fraaktør
      t.references :rolle, null: false, foreign_key: { to_table: :oda_aktør_aktør_roller }
      t.references :tilaktør
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_aktørtyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato
    end

    create_table :oda_aktører do |t|
      t.string :biografi
      t.string :efternavn
      t.string :fornavn
      t.string :gruppenavnkort
      t.string :navn, index: true
      t.datetime :slutdato
      t.datetime :startdato
      t.references :periode, null: true,  foreign_key: { to_table: :oda_perioder }
      t.references :type,    null: false, foreign_key: { to_table: :oda_aktørtyper }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokumentkategorier do |t|
      t.datetime :opdateringsdato, index: true
      t.string :kategori
    end

    create_table :oda_dokumentstatuser do |t|
      t.string :status
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokumenttyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokumenter do |t|
      t.integer :dagsordenudgavenummer
      t.datetime :dato, index: true
      t.datetime :frigivelsesdato
      t.string :grundnotatstatus
      t.datetime :modtagelsesdato
      t.string :offentlighedskode
      t.string :paragraf
      t.string :paragrafnummer
      t.string :procedurenummer
      t.string :spørgsmålsordlyd
      t.string :spørgsmålstitel
      t.string :titel, index: true
      t.references :kategori,  null: false, foreign_key: { to_table: :oda_dokumentkategorier }
      t.references :spørgsmål, null: true   # self-referential
      t.references :status,    null: false, foreign_key: { to_table: :oda_dokumentstatuser }
      t.references :type,      null: false, foreign_key: { to_table: :oda_dokumenttyper }
      t.datetime :opdateringsdato, index: true
    end
    add_foreign_key :oda_dokumenter, :oda_dokumenter, column: :spørgsmål_id, deferrable: :deferred

    create_table :oda_dagsordenspunkter do |t|
      t.string :forhandling
      t.string :forhandlingskode
      t.string :kommentar
      t.string :kørebemærkning
      t.string :nummer
      t.string :offentlighedskode
      t.string :titel
      t.references :møde,     null: false, foreign_key: { to_table: :oda_møder }
      t.references :sagstrin, null: true,  foreign_key: { to_table: :oda_sagstrin }
      t.references :super,    null: true   # self-referential
      t.datetime :opdateringsdato, index: true
    end
    add_foreign_key :oda_dagsordenspunkter, :oda_dagsordenspunkter, column: :super_id, deferrable: :deferred

    create_table :oda_dagsordenspunkt_dokumenter do |t|
      t.string :note
      t.references :dagsordenspunkt, null: false, foreign_key: { to_table: :oda_dagsordenspunkter }
      t.references :dokument,        null: false, foreign_key: { to_table: :oda_dokumenter }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dagsordenspunkt_sager do |t|
      t.references :dagsordenspunkt, null: false, foreign_key: { to_table: :oda_dagsordenspunkter }
      t.references :sag,             null: false, foreign_key: { to_table: :oda_sager }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokument_aktør_roller do |t|
      t.string :rolle
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_dokument_aktører do |t|
      t.references :aktør,    null: false, foreign_key: { to_table: :oda_aktører }
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.references :rolle,    null: false, foreign_key: { to_table: :oda_dokument_aktør_roller }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_emneordstyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_emneord do |t|
      t.string :emneord, index: true
      t.integer :emneord_sager_count,      default: 0, index: true
      t.integer :emneord_dokumenter_count, default: 0
      t.references :type, null: false, foreign_key: { to_table: :oda_emneordstyper }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_emneord_dokumenter do |t|
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.references :emneord,  null: false, foreign_key: { to_table: :oda_emneord }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_emneord_sager do |t|
      t.references :emneord, null: false, foreign_key: { to_table: :oda_emneord }
      t.references :sag,     null: false, foreign_key: { to_table: :oda_sager }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_entitet_beskrivelser do |t|
      t.string :entitetnavn
      t.string :beskrivelse
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_filer do |t|
      t.string :filurl
      t.string :format
      t.string :titel
      t.string :variantkode
      t.datetime :versionsdato
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.datetime :opdateringsdato, index: true
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
      t.references :aktør, null: false, foreign_key: { to_table: :oda_aktører }
      t.references :møde,  null: false, foreign_key: { to_table: :oda_møder }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_omtryk do |t|
      t.string :begrundelse
      t.datetime :dato
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sag_aktør_roller do |t|
      t.string :rolle
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sag_aktører do |t|
      t.references :aktør, null: false, foreign_key: { to_table: :oda_aktører }
      t.references :rolle, null: false, foreign_key: { to_table: :oda_sag_aktør_roller }
      t.references :sag,   null: false, foreign_key: { to_table: :oda_sager }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sag_dokument_roller do |t|
      t.string :rolle
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sag_dokumenter do |t|
      t.string :bilagsnummer
      t.datetime :frigivelsesdato
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.references :rolle,    null: false, foreign_key: { to_table: :oda_sag_dokument_roller }
      t.references :sag,      null: false, foreign_key: { to_table: :oda_sager }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstrin_aktør_roller do |t|
      t.string :rolle
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstrin_aktører do |t|
      t.references :aktør,    null: false, foreign_key: { to_table: :oda_aktører }
      t.references :rolle,    null: false, foreign_key: { to_table: :oda_sagstrin_aktør_roller }
      t.references :sagstrin, null: false, foreign_key: { to_table: :oda_sagstrin }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sagstrin_dokumenter do |t|
      t.references :dokument, null: false, foreign_key: { to_table: :oda_dokumenter }
      t.references :sagstrin, null: false, foreign_key: { to_table: :oda_sagstrin }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_sambehandlinger do |t|
      t.references :andetsagstrin,  null: false, foreign_key: { to_table: :oda_sagstrin }
      t.references :førstesagstrin, null: false, foreign_key: { to_table: :oda_sagstrin }
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_slettet_maps do |t|
      t.string :datatype
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_slettets do |t|
      t.references :slettetmap, null: false, foreign_key: { to_table: :oda_slettet_maps }
      t.references :objekt # any
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_stemmetyper do |t|
      t.string :typenavn
      t.datetime :opdateringsdato, index: true
    end

    create_table :oda_stemmer do |t|
      t.references :afstemning, null: false, foreign_key: { to_table: :oda_afstemninger }
      t.references :aktør, null: false, foreign_key: { to_table: :oda_aktører }
      t.references :type, null: false, foreign_key: { to_table: :oda_stemmetyper }
      t.datetime :opdateringsdato, index: true
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
