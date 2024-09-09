class CreateInitialSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :oda_afstemninger, force: :cascade do |t|
      t.string :kommentar
      t.string :konklusion
      t.integer :møde_id
      t.integer :nummer
      t.datetime :opdateringsdato
      t.integer :sagstrin_id
      t.integer :type_id
      t.boolean :vedtaget

      t.index :møde_id
      t.index :opdateringsdato
      t.index :sagstrin_id
      t.index :type_id
    end

    create_table :oda_afstemningstyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :oda_aktør_aktør_roller, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :rolle

      t.index :opdateringsdato
    end

    create_table :oda_aktør_aktører, force: :cascade do |t|
      t.integer :fraaktør_id
      t.datetime :opdateringsdato
      t.integer :rolle_id
      t.datetime :slutdato
      t.datetime :startdato
      t.integer :tilaktør_id

      t.index :fraaktør_id
      t.index :opdateringsdato
      t.index :rolle_id
      t.index :tilaktør_id
    end

    create_table :oda_aktører, force: :cascade do |t|
      t.string :biografi
      t.string :efternavn
      t.string :fornavn
      t.string :gruppenavnkort
      t.string :navn
      t.datetime :opdateringsdato
      t.integer :periode_id
      t.datetime :slutdato
      t.datetime :startdato
      t.integer :type_id

      t.index :navn
      t.index :opdateringsdato
      t.index :periode_id
      t.index :type_id
    end

    create_table :oda_aktørtyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_dagsordenspunkt_dokumenter, force: :cascade do |t|
      t.integer :dagsordenspunkt_id
      t.integer :dokument_id
      t.string :note
      t.datetime :opdateringsdato

      t.index :dagsordenspunkt_id
      t.index :dokument_id
      t.index :opdateringsdato
    end

    create_table :oda_dagsordenspunkt_sager, force: :cascade do |t|
      t.integer :dagsordenspunkt_id
      t.datetime :opdateringsdato
      t.integer :sag_id

      t.index :dagsordenspunkt_id
      t.index :opdateringsdato
      t.index :sag_id
    end

    create_table :oda_dagsordenspunkter, force: :cascade do |t|
      t.string :forhandling
      t.string :forhandlingskode
      t.string :kommentar
      t.string :kørebemærkning
      t.integer :møde_id
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.integer :sagstrin_id
      t.integer :super_id
      t.string :titel

      t.index :møde_id
      t.index :opdateringsdato
      t.index :sagstrin_id
      t.index :super_id
    end

    create_table :oda_dokument_aktør_roller, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :rolle

      t.index :opdateringsdato
    end

    create_table :oda_dokument_aktører, force: :cascade do |t|
      t.integer :aktør_id
      t.integer :dokument_id
      t.datetime :opdateringsdato
      t.integer :rolle_id

      t.index :aktør_id
      t.index :dokument_id
      t.index :opdateringsdato
      t.index :rolle_id
    end

    create_table :oda_dokumenter, force: :cascade do |t|
      t.integer :dagsordenudgavenummer
      t.datetime :dato
      t.datetime :frigivelsesdato
      t.string :grundnotatstatus
      t.integer :kategori_id
      t.datetime :modtagelsesdato
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.string :paragraf
      t.string :paragrafnummer
      t.string :procedurenummer
      t.integer :spørgsmåls_id
      t.string :spørgsmålsordlyd
      t.string :spørgsmålstitel
      t.integer :status_id
      t.string :titel
      t.integer :type_id

      t.index :dato
      t.index :kategori_id
      t.index :opdateringsdato
      t.index :spørgsmåls_id
      t.index :status_id
      t.index :titel
      t.index :type_id
    end

    create_table :oda_dokumentkategorier, force: :cascade do |t|
      t.string :kategori
      t.datetime :opdateringsdato

      t.index :opdateringsdato
    end

    create_table :oda_dokumentstatuser, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :status

      t.index :opdateringsdato
    end

    create_table :oda_dokumenttyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :oda_emneord, force: :cascade do |t|
      t.string :emneord
      t.datetime :opdateringsdato
      t.integer :type_id
      t.integer :emneord_sager_count, default: 0
      t.integer :emneord_dokumenter_count, default: 0

      t.index :emneord
      t.index :emneord_sager_count
      t.index :opdateringsdato
      t.index :type_id
    end

    create_table :oda_emneord_dokumenter, force: :cascade do |t|
      t.integer :dokument_id
      t.integer :emneord_id
      t.datetime :opdateringsdato

      t.index :dokument_id
      t.index :emneord_id
      t.index :opdateringsdato
    end

    create_table :oda_emneord_sager, force: :cascade do |t|
      t.integer :emneord_id
      t.datetime :opdateringsdato
      t.integer :sag_id

      t.index :emneord_id
      t.index :opdateringsdato
      t.index :sag_id
    end

    create_table :oda_emneordstyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :oda_entitet_beskrivelser, force: :cascade do |t|
      t.string :entitetnavn
      t.string :beskrivelse
      t.datetime :opdateringsdato

      t.index :opdateringsdato
    end

    create_table :oda_filer, force: :cascade do |t|
      t.integer :dokument_id
      t.string :filurl
      t.string :format
      t.datetime :opdateringsdato
      t.string :titel
      t.string :variantkode
      t.datetime :versionsdato

      t.index :dokument_id
      t.index :opdateringsdato
    end

    create_table :oda_id_maps, force: :cascade do |t|
      t.string :original_id
      t.string :entity
    end

    create_table :oda_kollone_beskrivelser, force: :cascade do |t|
      t.string :entitetnavn
      t.string :kollonenavn
      t.string :beskrivelse
      t.datetime :opdateringsdato

      t.index :opdateringsdato
    end

    create_table :oda_møde_aktører, force: :cascade do |t|
      t.integer :aktør_id
      t.integer :møde_id
      t.datetime :opdateringsdato

      t.index :aktør_id
      t.index :møde_id
      t.index :opdateringsdato
    end

    create_table :oda_møder, force: :cascade do |t|
      t.string :dagsordenurl
      t.datetime :dato
      t.string :lokale
      t.string :nummer
      t.string :offentlighedskode
      t.datetime :opdateringsdato
      t.integer :periode_id
      t.string :starttidsbemærkning
      t.integer :status_id
      t.string :titel
      t.integer :type_id

      t.index :dato
      t.index :opdateringsdato
      t.index :periode_id
      t.index :status_id
      t.index :type_id
    end

    create_table :oda_mødestatuser, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :status

      t.index :opdateringsdato
    end

    create_table :oda_mødetyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :oda_omtryk, force: :cascade do |t|
      t.string :begrundelse
      t.datetime :dato
      t.integer :dokument_id
      t.datetime :opdateringsdato

      t.index :dokument_id
      t.index :opdateringsdato
    end

    create_table :oda_perioder, force: :cascade do |t|
      t.string :kode
      t.datetime :opdateringsdato
      t.datetime :slutdato
      t.datetime :startdato
      t.string :titel
      t.string :typenavn
      t.integer :aktører_count, default: 0
      t.integer :møder_count, default: 0
      t.integer :sager_count, default: 0

      t.index :kode
      t.index :opdateringsdato
    end

    create_table :oda_sag_aktør_roller, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :rolle

      t.index :opdateringsdato
    end

    create_table :oda_sag_aktører, force: :cascade do |t|
      t.integer :aktør_id
      t.datetime :opdateringsdato
      t.integer :rolle_id
      t.integer :sag_id

      t.index :aktør_id
      t.index :opdateringsdato
      t.index :rolle_id
      t.index :sag_id
    end

    create_table :oda_sag_dokument_roller, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :rolle

      t.index :opdateringsdato
    end

    create_table :oda_sag_dokumenter, force: :cascade do |t|
      t.string :bilagsnummer
      t.integer :dokument_id
      t.datetime :frigivelsesdato
      t.datetime :opdateringsdato
      t.integer :rolle_id
      t.integer :sag_id

      t.index :dokument_id
      t.index :opdateringsdato
      t.index :rolle_id
      t.index :sag_id
    end

    create_table :oda_sager, force: :cascade do |t|
      t.string :afgørelse
      t.datetime :afgørelsesdato
      t.string :afgørelsesresultatkode
      t.string :afstemningskonklusion
      t.string :baggrundsmateriale
      t.string :begrundelse
      t.integer :deltundersag_id
      t.integer :fremsatundersag_id
      t.integer :kategori_id
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
      t.integer :periode_id
      t.string :resume
      t.string :retsinformationsurl
      t.datetime :rådsmødedato
      t.boolean :statsbudgetsag
      t.integer :status_id
      t.string :titel
      t.string :titelkort
      t.integer :type_id

      t.index :deltundersag_id
      t.index :fremsatundersag_id
      t.index :kategori_id
      t.index :nummernumerisk
      t.index :opdateringsdato
      t.index :periode_id
      t.index :status_id
      t.index :titel
      t.index :type_id
    end

    create_table :oda_sagskategorier, force: :cascade do |t|
      t.string :kategori
      t.datetime :opdateringsdato

      t.index :opdateringsdato
    end

    create_table :oda_sagsstatuser, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :status

      t.index :opdateringsdato
    end

    create_table :oda_sagstrin, force: :cascade do |t|
      t.datetime :dato
      t.string :folketingstidende
      t.string :folketingstidendesidenummer
      t.string :folketingstidendeurl
      t.datetime :opdateringsdato
      t.integer :sag_id
      t.integer :status_id
      t.string :titel
      t.integer :type_id

      t.index :opdateringsdato
      t.index :sag_id
      t.index :status_id
      t.index :type_id
    end

    create_table :oda_sagstrin_aktør_roller, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :rolle

      t.index :opdateringsdato
    end

    create_table :oda_sagstrin_aktører, force: :cascade do |t|
      t.integer :aktør_id
      t.datetime :opdateringsdato
      t.integer :rolle_id
      t.integer :sagstrin_id

      t.index :aktør_id
      t.index :opdateringsdato
      t.index :rolle_id
      t.index :sagstrin_id
    end

    create_table :oda_sagstrin_dokumenter, force: :cascade do |t|
      t.integer :dokument_id
      t.datetime :opdateringsdato
      t.integer :sagstrin_id

      t.index :dokument_id
      t.index :opdateringsdato
      t.index :sagstrin_id
    end

    create_table :oda_sagstrinsstatuser, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :status

      t.index :opdateringsdato
    end

    create_table :oda_sagstrinstyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :oda_sagstyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn
    end

    create_table :oda_sambehandlinger, force: :cascade do |t|
      t.integer :andetsagstrin_id
      t.integer :førstesagstrin_id
      t.datetime :opdateringsdato

      t.index :andetsagstrin_id
      t.index :førstesagstrin_id
      t.index :opdateringsdato
    end

    create_table :oda_slettet_maps, force: :cascade do |t|
      t.string :datatype
      t.datetime :opdateringsdato

      t.index :opdateringsdato
    end

    create_table :oda_slettets, force: :cascade do |t|
      t.integer :slettetmap_id
      t.datetime :opdateringsdato
      t.string :objekt_id

      t.index :opdateringsdato
      t.index :slettetmap_id
    end

    create_table :oda_stemmer, force: :cascade do |t|
      t.integer :afstemning_id
      t.integer :aktør_id
      t.datetime :opdateringsdato
      t.integer :type_id

      t.index :afstemning_id
      t.index :aktør_id
      t.index :opdateringsdato
      t.index :type_id
    end

    create_table :oda_stemmetyper, force: :cascade do |t|
      t.datetime :opdateringsdato
      t.string :typenavn

      t.index :opdateringsdato
    end

    create_table :search_agents, force: :cascade do |t|
      t.string :name, null: false
      t.string :query, null: false
      t.datetime :executed_at
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :searches, force: :cascade do |t|
      t.string :query
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :users, force: :cascade do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.string :password_digest
      t.boolean :verified, default: false, null: false
      t.boolean :admin, default: false, null: false
      t.timestamps
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
