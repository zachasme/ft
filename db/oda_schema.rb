# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_10_08_104947) do
  create_table "oda_afstemninger", force: :cascade do |t|
    t.string "kommentar"
    t.string "konklusion"
    t.integer "møde_id"
    t.integer "nummer"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.integer "type_id"
    t.boolean "vedtaget"
    t.index ["møde_id"], name: "index_oda_afstemninger_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_afstemninger_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_afstemninger_on_sagstrin_id"
    t.index ["type_id"], name: "index_oda_afstemninger_on_type_id"
  end

  create_table "oda_afstemningstyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_afstemningstyper_on_opdateringsdato"
  end

  create_table "oda_aktør_aktør_roller", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_aktør_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_aktør_aktører", force: :cascade do |t|
    t.integer "fraaktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "tilaktør_id"
    t.index ["fraaktør_id"], name: "index_oda_aktør_aktører_on_fraaktør_id"
    t.index ["opdateringsdato"], name: "index_oda_aktør_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_aktør_aktører_on_rolle_id"
    t.index ["tilaktør_id"], name: "index_oda_aktør_aktører_on_tilaktør_id"
  end

  create_table "oda_aktører", force: :cascade do |t|
    t.string "biografi"
    t.string "efternavn"
    t.string "fornavn"
    t.string "gruppenavnkort"
    t.string "navn"
    t.datetime "opdateringsdato"
    t.integer "periode_id"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "type_id"
    t.index ["navn"], name: "index_oda_aktører_on_navn"
    t.index ["opdateringsdato"], name: "index_oda_aktører_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_aktører_on_periode_id"
    t.index ["type_id"], name: "index_oda_aktører_on_type_id"
  end

  create_table "oda_aktørtyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_dagsordenspunkt_dokumenter", force: :cascade do |t|
    t.integer "dagsordenspunkt_id"
    t.integer "dokument_id"
    t.string "note"
    t.datetime "opdateringsdato"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_dokumenter_on_dagsordenspunkt_id"
    t.index ["dokument_id"], name: "index_oda_dagsordenspunkt_dokumenter_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_dokumenter_on_opdateringsdato"
  end

  create_table "oda_dagsordenspunkt_sager", force: :cascade do |t|
    t.integer "dagsordenspunkt_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_sager_on_dagsordenspunkt_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_sager_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_dagsordenspunkt_sager_on_sag_id"
  end

  create_table "oda_dagsordenspunkter", force: :cascade do |t|
    t.string "forhandling"
    t.string "forhandlingskode"
    t.string "kommentar"
    t.string "kørebemærkning"
    t.integer "møde_id"
    t.string "nummer"
    t.string "offentlighedskode"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.integer "super_id"
    t.string "titel"
    t.index ["møde_id"], name: "index_oda_dagsordenspunkter_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkter_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_dagsordenspunkter_on_sagstrin_id"
    t.index ["super_id"], name: "index_oda_dagsordenspunkter_on_super_id"
  end

  create_table "oda_dokument_aktør_roller", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_dokument_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_dokument_aktører", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.index ["aktør_id"], name: "index_oda_dokument_aktører_on_aktør_id"
    t.index ["dokument_id"], name: "index_oda_dokument_aktører_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_dokument_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_dokument_aktører_on_rolle_id"
  end

  create_table "oda_dokumenter", force: :cascade do |t|
    t.integer "dagsordenudgavenummer"
    t.datetime "dato"
    t.datetime "frigivelsesdato"
    t.string "grundnotatstatus"
    t.integer "kategori_id"
    t.datetime "modtagelsesdato"
    t.string "offentlighedskode"
    t.datetime "opdateringsdato"
    t.string "paragraf"
    t.string "paragrafnummer"
    t.string "procedurenummer"
    t.integer "spørgsmåls_id"
    t.string "spørgsmålsordlyd"
    t.string "spørgsmålstitel"
    t.integer "status_id"
    t.string "titel"
    t.integer "type_id"
    t.index ["dato"], name: "index_oda_dokumenter_on_dato"
    t.index ["kategori_id"], name: "index_oda_dokumenter_on_kategori_id"
    t.index ["opdateringsdato"], name: "index_oda_dokumenter_on_opdateringsdato"
    t.index ["spørgsmåls_id"], name: "index_oda_dokumenter_on_spørgsmåls_id"
    t.index ["status_id"], name: "index_oda_dokumenter_on_status_id"
    t.index ["titel"], name: "index_oda_dokumenter_on_titel"
    t.index ["type_id"], name: "index_oda_dokumenter_on_type_id"
  end

  create_table "oda_dokumentkategorier", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_dokumentkategorier_on_opdateringsdato"
  end

  create_table "oda_dokumentstatuser", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_dokumentstatuser_on_opdateringsdato"
  end

  create_table "oda_dokumenttyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_dokumenttyper_on_opdateringsdato"
  end

  create_table "oda_emneord", force: :cascade do |t|
    t.string "emneord"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.integer "emneord_sager_count", default: 0
    t.integer "emneord_dokumenter_count", default: 0
    t.index ["emneord"], name: "index_oda_emneord_on_emneord"
    t.index ["emneord_sager_count"], name: "index_oda_emneord_on_emneord_sager_count"
    t.index ["opdateringsdato"], name: "index_oda_emneord_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_emneord_on_type_id"
  end

  create_table "oda_emneord_dokumenter", force: :cascade do |t|
    t.integer "dokument_id"
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_emneord_dokumenter_on_dokument_id"
    t.index ["emneord_id"], name: "index_oda_emneord_dokumenter_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_dokumenter_on_opdateringsdato"
  end

  create_table "oda_emneord_sager", force: :cascade do |t|
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["emneord_id"], name: "index_oda_emneord_sager_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_sager_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_emneord_sager_on_sag_id"
  end

  create_table "oda_emneordstyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_emneordstyper_on_opdateringsdato"
  end

  create_table "oda_entitet_beskrivelser", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_entitet_beskrivelser_on_opdateringsdato"
  end

  create_table "oda_filer", force: :cascade do |t|
    t.integer "dokument_id"
    t.string "filurl"
    t.string "format"
    t.datetime "opdateringsdato"
    t.string "titel"
    t.string "variantkode"
    t.datetime "versionsdato"
    t.index ["dokument_id"], name: "index_oda_filer_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_filer_on_opdateringsdato"
  end

  create_table "oda_id_maps", force: :cascade do |t|
    t.string "original_id"
    t.string "entity"
  end

  create_table "oda_kollone_beskrivelser", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "kollonenavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_kollone_beskrivelser_on_opdateringsdato"
  end

  create_table "oda_møde_aktører", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "møde_id"
    t.datetime "opdateringsdato"
    t.index ["aktør_id"], name: "index_oda_møde_aktører_on_aktør_id"
    t.index ["møde_id"], name: "index_oda_møde_aktører_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_møde_aktører_on_opdateringsdato"
  end

  create_table "oda_møder", force: :cascade do |t|
    t.string "dagsordenurl"
    t.datetime "dato"
    t.string "lokale"
    t.string "nummer"
    t.string "offentlighedskode"
    t.datetime "opdateringsdato"
    t.integer "periode_id"
    t.string "starttidsbemærkning"
    t.integer "status_id"
    t.string "titel"
    t.integer "type_id"
    t.index ["dato"], name: "index_oda_møder_on_dato"
    t.index ["opdateringsdato"], name: "index_oda_møder_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_møder_on_periode_id"
    t.index ["status_id"], name: "index_oda_møder_on_status_id"
    t.index ["type_id"], name: "index_oda_møder_on_type_id"
  end

  create_table "oda_mødestatuser", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_mødestatuser_on_opdateringsdato"
  end

  create_table "oda_mødetyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_mødetyper_on_opdateringsdato"
  end

  create_table "oda_omtryk", force: :cascade do |t|
    t.string "begrundelse"
    t.datetime "dato"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_omtryk_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_omtryk_on_opdateringsdato"
  end

  create_table "oda_perioder", force: :cascade do |t|
    t.string "kode"
    t.datetime "opdateringsdato"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.string "titel"
    t.string "typenavn"
    t.integer "aktører_count", default: 0
    t.integer "møder_count", default: 0
    t.integer "sager_count", default: 0
    t.index ["kode"], name: "index_oda_perioder_on_kode"
    t.index ["opdateringsdato"], name: "index_oda_perioder_on_opdateringsdato"
  end

  create_table "oda_sag_aktør_roller", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_sag_aktører", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["aktør_id"], name: "index_oda_sag_aktører_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sag_aktører_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_aktører_on_sag_id"
  end

  create_table "oda_sag_dokument_roller", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sag_dokument_roller_on_opdateringsdato"
  end

  create_table "oda_sag_dokumenter", force: :cascade do |t|
    t.string "bilagsnummer"
    t.integer "dokument_id"
    t.datetime "frigivelsesdato"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["dokument_id"], name: "index_oda_sag_dokumenter_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_sag_dokumenter_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sag_dokumenter_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_dokumenter_on_sag_id"
  end

  create_table "oda_sager", force: :cascade do |t|
    t.string "afgørelse"
    t.datetime "afgørelsesdato"
    t.string "afgørelsesresultatkode"
    t.string "afstemningskonklusion"
    t.string "baggrundsmateriale"
    t.string "begrundelse"
    t.integer "deltundersag_id"
    t.integer "fremsatundersag_id"
    t.integer "kategori_id"
    t.string "lovnummer"
    t.datetime "lovnummerdato"
    t.string "nummer"
    t.string "nummernumerisk"
    t.string "nummerpostfix"
    t.string "nummerprefix"
    t.string "offentlighedskode"
    t.datetime "opdateringsdato"
    t.string "paragraf"
    t.integer "paragrafnummer"
    t.integer "periode_id"
    t.string "resume"
    t.string "retsinformationsurl"
    t.datetime "rådsmødedato"
    t.boolean "statsbudgetsag"
    t.integer "status_id"
    t.string "titel"
    t.string "titelkort"
    t.integer "type_id"
    t.index ["deltundersag_id"], name: "index_oda_sager_on_deltundersag_id"
    t.index ["fremsatundersag_id"], name: "index_oda_sager_on_fremsatundersag_id"
    t.index ["kategori_id"], name: "index_oda_sager_on_kategori_id"
    t.index ["nummernumerisk"], name: "index_oda_sager_on_nummernumerisk"
    t.index ["opdateringsdato"], name: "index_oda_sager_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_sager_on_periode_id"
    t.index ["status_id"], name: "index_oda_sager_on_status_id"
    t.index ["titel"], name: "index_oda_sager_on_titel"
    t.index ["type_id"], name: "index_oda_sager_on_type_id"
  end

  create_table "oda_sagskategorier", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagskategorier_on_opdateringsdato"
  end

  create_table "oda_sagsstatuser", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_sagsstatuser_on_opdateringsdato"
  end

  create_table "oda_sagstrin", force: :cascade do |t|
    t.datetime "dato"
    t.string "folketingstidende"
    t.string "folketingstidendesidenummer"
    t.string "folketingstidendeurl"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.integer "status_id"
    t.string "titel"
    t.integer "type_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_sagstrin_on_sag_id"
    t.index ["status_id"], name: "index_oda_sagstrin_on_status_id"
    t.index ["type_id"], name: "index_oda_sagstrin_on_type_id"
  end

  create_table "oda_sagstrin_aktør_roller", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_sagstrin_aktører", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sagstrin_id"
    t.index ["aktør_id"], name: "index_oda_sagstrin_aktører_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sagstrin_aktører_on_rolle_id"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_aktører_on_sagstrin_id"
  end

  create_table "oda_sagstrin_dokumenter", force: :cascade do |t|
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.index ["dokument_id"], name: "index_oda_sagstrin_dokumenter_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_dokumenter_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_dokumenter_on_sagstrin_id"
  end

  create_table "oda_sagstrinsstatuser", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinsstatuser_on_opdateringsdato"
  end

  create_table "oda_sagstrinstyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinstyper_on_opdateringsdato"
  end

  create_table "oda_sagstyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_sambehandlinger", force: :cascade do |t|
    t.integer "andetsagstrin_id"
    t.integer "førstesagstrin_id"
    t.datetime "opdateringsdato"
    t.index ["andetsagstrin_id"], name: "index_oda_sambehandlinger_on_andetsagstrin_id"
    t.index ["førstesagstrin_id"], name: "index_oda_sambehandlinger_on_førstesagstrin_id"
    t.index ["opdateringsdato"], name: "index_oda_sambehandlinger_on_opdateringsdato"
  end

  create_table "oda_slettet_maps", force: :cascade do |t|
    t.string "datatype"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_slettet_maps_on_opdateringsdato"
  end

  create_table "oda_slettets", force: :cascade do |t|
    t.integer "slettetmap_id"
    t.datetime "opdateringsdato"
    t.integer "objekt_id"
    t.index ["objekt_id"], name: "index_oda_slettets_on_objekt_id"
    t.index ["opdateringsdato"], name: "index_oda_slettets_on_opdateringsdato"
    t.index ["slettetmap_id"], name: "index_oda_slettets_on_slettetmap_id"
  end

  create_table "oda_stemmer", force: :cascade do |t|
    t.integer "afstemning_id"
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.index ["afstemning_id"], name: "index_oda_stemmer_on_afstemning_id"
    t.index ["aktør_id"], name: "index_oda_stemmer_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_stemmer_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_stemmer_on_type_id"
  end

  create_table "oda_stemmetyper", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_stemmetyper_on_opdateringsdato"
  end

  # Virtual tables defined in this database.
  # Note that virtual tables may not work with other database engines. Be careful if changing database.
  create_virtual_table "oda_sager_search_index", "fts5", ["titel", "titelkort", "resume", "content=oda_sager", "content_rowid=id"]
end
