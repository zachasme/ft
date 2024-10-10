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
    t.integer "nummer"
    t.boolean "vedtaget"
    t.integer "møde_id", null: false
    t.integer "sagstrin_id"
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["møde_id"], name: "index_oda_afstemninger_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_afstemninger_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_afstemninger_on_sagstrin_id"
    t.index ["type_id"], name: "index_oda_afstemninger_on_type_id"
  end

  create_table "oda_afstemningstyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_afstemningstyper_on_opdateringsdato"
  end

  create_table "oda_aktør_aktør_roller", force: :cascade do |t|
    t.string "rolle"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_aktør_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_aktør_aktører", force: :cascade do |t|
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "fraaktør_id"
    t.integer "rolle_id", null: false
    t.integer "tilaktør_id"
    t.datetime "opdateringsdato"
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
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "periode_id"
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["navn"], name: "index_oda_aktører_on_navn"
    t.index ["opdateringsdato"], name: "index_oda_aktører_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_aktører_on_periode_id"
    t.index ["type_id"], name: "index_oda_aktører_on_type_id"
  end

  create_table "oda_aktørtyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
  end

  create_table "oda_dagsordenspunkt_dokumenter", force: :cascade do |t|
    t.string "note"
    t.integer "dagsordenspunkt_id", null: false
    t.integer "dokument_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_dokumenter_on_dagsordenspunkt_id"
    t.index ["dokument_id"], name: "index_oda_dagsordenspunkt_dokumenter_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_dokumenter_on_opdateringsdato"
  end

  create_table "oda_dagsordenspunkt_sager", force: :cascade do |t|
    t.integer "dagsordenspunkt_id", null: false
    t.integer "sag_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_sager_on_dagsordenspunkt_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_sager_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_dagsordenspunkt_sager_on_sag_id"
  end

  create_table "oda_dagsordenspunkter", force: :cascade do |t|
    t.string "forhandling"
    t.string "forhandlingskode"
    t.string "kommentar"
    t.string "kørebemærkning"
    t.string "nummer"
    t.string "offentlighedskode"
    t.string "titel"
    t.integer "møde_id", null: false
    t.integer "sagstrin_id"
    t.integer "super_id"
    t.datetime "opdateringsdato"
    t.index ["møde_id"], name: "index_oda_dagsordenspunkter_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkter_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_dagsordenspunkter_on_sagstrin_id"
    t.index ["super_id"], name: "index_oda_dagsordenspunkter_on_super_id"
  end

  create_table "oda_dokument_aktør_roller", force: :cascade do |t|
    t.string "rolle"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_dokument_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_dokument_aktører", force: :cascade do |t|
    t.integer "aktør_id", null: false
    t.integer "dokument_id", null: false
    t.integer "rolle_id", null: false
    t.datetime "opdateringsdato"
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
    t.datetime "modtagelsesdato"
    t.string "offentlighedskode"
    t.string "paragraf"
    t.string "paragrafnummer"
    t.string "procedurenummer"
    t.string "spørgsmålsordlyd"
    t.string "spørgsmålstitel"
    t.string "titel"
    t.integer "kategori_id", null: false
    t.integer "spørgsmål_id"
    t.integer "status_id", null: false
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dato"], name: "index_oda_dokumenter_on_dato"
    t.index ["kategori_id"], name: "index_oda_dokumenter_on_kategori_id"
    t.index ["opdateringsdato"], name: "index_oda_dokumenter_on_opdateringsdato"
    t.index ["spørgsmål_id"], name: "index_oda_dokumenter_on_spørgsmål_id"
    t.index ["status_id"], name: "index_oda_dokumenter_on_status_id"
    t.index ["titel"], name: "index_oda_dokumenter_on_titel"
    t.index ["type_id"], name: "index_oda_dokumenter_on_type_id"
  end

  create_table "oda_dokumentkategorier", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "kategori"
    t.index ["opdateringsdato"], name: "index_oda_dokumentkategorier_on_opdateringsdato"
  end

  create_table "oda_dokumentstatuser", force: :cascade do |t|
    t.string "status"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_dokumentstatuser_on_opdateringsdato"
  end

  create_table "oda_dokumenttyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_dokumenttyper_on_opdateringsdato"
  end

  create_table "oda_emneord", force: :cascade do |t|
    t.string "emneord"
    t.integer "emneord_sager_count", default: 0
    t.integer "emneord_dokumenter_count", default: 0
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["emneord"], name: "index_oda_emneord_on_emneord"
    t.index ["emneord_sager_count"], name: "index_oda_emneord_on_emneord_sager_count"
    t.index ["opdateringsdato"], name: "index_oda_emneord_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_emneord_on_type_id"
  end

  create_table "oda_emneord_dokumenter", force: :cascade do |t|
    t.integer "dokument_id", null: false
    t.integer "emneord_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_emneord_dokumenter_on_dokument_id"
    t.index ["emneord_id"], name: "index_oda_emneord_dokumenter_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_dokumenter_on_opdateringsdato"
  end

  create_table "oda_emneord_sager", force: :cascade do |t|
    t.integer "emneord_id", null: false
    t.integer "sag_id", null: false
    t.datetime "opdateringsdato"
    t.index ["emneord_id"], name: "index_oda_emneord_sager_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_sager_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_emneord_sager_on_sag_id"
  end

  create_table "oda_emneordstyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_emneordstyper_on_opdateringsdato"
  end

  create_table "oda_entitet_beskrivelser", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_entitet_beskrivelser_on_opdateringsdato"
  end

  create_table "oda_filer", force: :cascade do |t|
    t.string "filurl"
    t.string "format"
    t.string "titel"
    t.string "variantkode"
    t.datetime "versionsdato"
    t.integer "dokument_id", null: false
    t.datetime "opdateringsdato"
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
    t.integer "aktør_id", null: false
    t.integer "møde_id", null: false
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
    t.string "starttidsbemærkning"
    t.string "titel"
    t.integer "periode_id", null: false
    t.integer "status_id", null: false
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dato"], name: "index_oda_møder_on_dato"
    t.index ["opdateringsdato"], name: "index_oda_møder_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_møder_on_periode_id"
    t.index ["status_id"], name: "index_oda_møder_on_status_id"
    t.index ["type_id"], name: "index_oda_møder_on_type_id"
  end

  create_table "oda_mødestatuser", force: :cascade do |t|
    t.string "status"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_mødestatuser_on_opdateringsdato"
  end

  create_table "oda_mødetyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_mødetyper_on_opdateringsdato"
  end

  create_table "oda_omtryk", force: :cascade do |t|
    t.string "begrundelse"
    t.datetime "dato"
    t.integer "dokument_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_omtryk_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_omtryk_on_opdateringsdato"
  end

  create_table "oda_perioder", force: :cascade do |t|
    t.string "kode"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.string "titel"
    t.string "typenavn"
    t.integer "aktører_count", default: 0
    t.integer "møder_count", default: 0
    t.integer "sager_count", default: 0
    t.datetime "opdateringsdato"
    t.index ["kode"], name: "index_oda_perioder_on_kode"
    t.index ["opdateringsdato"], name: "index_oda_perioder_on_opdateringsdato"
  end

  create_table "oda_sag_aktør_roller", force: :cascade do |t|
    t.string "rolle"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_sag_aktører", force: :cascade do |t|
    t.integer "aktør_id", null: false
    t.integer "rolle_id", null: false
    t.integer "sag_id", null: false
    t.datetime "opdateringsdato"
    t.index ["aktør_id"], name: "index_oda_sag_aktører_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sag_aktører_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_aktører_on_sag_id"
  end

  create_table "oda_sag_dokument_roller", force: :cascade do |t|
    t.string "rolle"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sag_dokument_roller_on_opdateringsdato"
  end

  create_table "oda_sag_dokumenter", force: :cascade do |t|
    t.string "bilagsnummer"
    t.datetime "frigivelsesdato"
    t.integer "dokument_id", null: false
    t.integer "rolle_id", null: false
    t.integer "sag_id", null: false
    t.datetime "opdateringsdato"
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
    t.string "resume"
    t.string "retsinformationsurl"
    t.datetime "rådsmødedato"
    t.boolean "statsbudgetsag"
    t.string "titel"
    t.string "titelkort"
    t.integer "deltundersag_id"
    t.integer "fremsatundersag_id"
    t.integer "kategori_id"
    t.integer "periode_id", null: false
    t.integer "status_id", null: false
    t.integer "type_id", null: false
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
    t.string "status"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagsstatuser_on_opdateringsdato"
  end

  create_table "oda_sagstrin", force: :cascade do |t|
    t.datetime "dato"
    t.string "folketingstidende"
    t.string "folketingstidendesidenummer"
    t.string "folketingstidendeurl"
    t.string "titel"
    t.integer "sag_id", null: false
    t.integer "status_id", null: false
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_sagstrin_on_sag_id"
    t.index ["status_id"], name: "index_oda_sagstrin_on_status_id"
    t.index ["type_id"], name: "index_oda_sagstrin_on_type_id"
  end

  create_table "oda_sagstrin_aktør_roller", force: :cascade do |t|
    t.string "rolle"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktør_roller_on_opdateringsdato"
  end

  create_table "oda_sagstrin_aktører", force: :cascade do |t|
    t.integer "aktør_id", null: false
    t.integer "rolle_id", null: false
    t.integer "sagstrin_id", null: false
    t.datetime "opdateringsdato"
    t.index ["aktør_id"], name: "index_oda_sagstrin_aktører_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktører_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sagstrin_aktører_on_rolle_id"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_aktører_on_sagstrin_id"
  end

  create_table "oda_sagstrin_dokumenter", force: :cascade do |t|
    t.integer "dokument_id", null: false
    t.integer "sagstrin_id", null: false
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_sagstrin_dokumenter_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_dokumenter_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_dokumenter_on_sagstrin_id"
  end

  create_table "oda_sagstrinsstatuser", force: :cascade do |t|
    t.string "status"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinsstatuser_on_opdateringsdato"
  end

  create_table "oda_sagstrinstyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinstyper_on_opdateringsdato"
  end

  create_table "oda_sagstyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
  end

  create_table "oda_sambehandlinger", force: :cascade do |t|
    t.integer "andetsagstrin_id", null: false
    t.integer "førstesagstrin_id", null: false
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
    t.integer "slettetmap_id", null: false
    t.integer "objekt_id"
    t.datetime "opdateringsdato"
    t.index ["objekt_id"], name: "index_oda_slettets_on_objekt_id"
    t.index ["opdateringsdato"], name: "index_oda_slettets_on_opdateringsdato"
    t.index ["slettetmap_id"], name: "index_oda_slettets_on_slettetmap_id"
  end

  create_table "oda_stemmer", force: :cascade do |t|
    t.integer "afstemning_id", null: false
    t.integer "aktør_id", null: false
    t.integer "type_id", null: false
    t.datetime "opdateringsdato"
    t.index ["afstemning_id"], name: "index_oda_stemmer_on_afstemning_id"
    t.index ["aktør_id"], name: "index_oda_stemmer_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_stemmer_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_stemmer_on_type_id"
  end

  create_table "oda_stemmetyper", force: :cascade do |t|
    t.string "typenavn"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_stemmetyper_on_opdateringsdato"
  end

  add_foreign_key "oda_afstemninger", "oda_afstemningstyper", column: "type_id"
  add_foreign_key "oda_afstemninger", "oda_møder", column: "møde_id"
  add_foreign_key "oda_afstemninger", "oda_sagstrin", column: "sagstrin_id"
  add_foreign_key "oda_aktør_aktører", "oda_aktør_aktør_roller", column: "rolle_id"
  add_foreign_key "oda_aktører", "oda_aktørtyper", column: "type_id"
  add_foreign_key "oda_aktører", "oda_perioder", column: "periode_id"
  add_foreign_key "oda_dagsordenspunkt_dokumenter", "oda_dagsordenspunkter", column: "dagsordenspunkt_id"
  add_foreign_key "oda_dagsordenspunkt_dokumenter", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_dagsordenspunkt_sager", "oda_dagsordenspunkter", column: "dagsordenspunkt_id"
  add_foreign_key "oda_dagsordenspunkt_sager", "oda_sager", column: "sag_id"
  add_foreign_key "oda_dagsordenspunkter", "oda_dagsordenspunkter", column: "super_id", deferrable: :deferred
  add_foreign_key "oda_dagsordenspunkter", "oda_møder", column: "møde_id"
  add_foreign_key "oda_dagsordenspunkter", "oda_sagstrin", column: "sagstrin_id"
  add_foreign_key "oda_dokument_aktører", "oda_aktører", column: "aktør_id"
  add_foreign_key "oda_dokument_aktører", "oda_dokument_aktør_roller", column: "rolle_id"
  add_foreign_key "oda_dokument_aktører", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_dokumenter", "oda_dokumentkategorier", column: "kategori_id"
  add_foreign_key "oda_dokumenter", "oda_dokumentstatuser", column: "status_id"
  add_foreign_key "oda_dokumenter", "oda_dokumenttyper", column: "type_id"
  add_foreign_key "oda_emneord", "oda_emneordstyper", column: "type_id"
  add_foreign_key "oda_emneord_dokumenter", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_emneord_dokumenter", "oda_emneord", column: "emneord_id"
  add_foreign_key "oda_emneord_sager", "oda_emneord", column: "emneord_id"
  add_foreign_key "oda_emneord_sager", "oda_sager", column: "sag_id"
  add_foreign_key "oda_filer", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_møde_aktører", "oda_aktører", column: "aktør_id"
  add_foreign_key "oda_møde_aktører", "oda_møder", column: "møde_id"
  add_foreign_key "oda_møder", "oda_mødestatuser", column: "status_id"
  add_foreign_key "oda_møder", "oda_mødetyper", column: "type_id"
  add_foreign_key "oda_møder", "oda_perioder", column: "periode_id"
  add_foreign_key "oda_omtryk", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_sag_aktører", "oda_aktører", column: "aktør_id"
  add_foreign_key "oda_sag_aktører", "oda_sag_aktør_roller", column: "rolle_id"
  add_foreign_key "oda_sag_aktører", "oda_sager", column: "sag_id"
  add_foreign_key "oda_sag_dokumenter", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_sag_dokumenter", "oda_sag_dokument_roller", column: "rolle_id"
  add_foreign_key "oda_sag_dokumenter", "oda_sager", column: "sag_id"
  add_foreign_key "oda_sager", "oda_perioder", column: "periode_id"
  add_foreign_key "oda_sager", "oda_sager", column: "deltundersag_id", deferrable: :deferred
  add_foreign_key "oda_sager", "oda_sager", column: "fremsatundersag_id", deferrable: :deferred
  add_foreign_key "oda_sager", "oda_sagskategorier", column: "kategori_id"
  add_foreign_key "oda_sager", "oda_sagsstatuser", column: "status_id"
  add_foreign_key "oda_sager", "oda_sagstyper", column: "type_id"
  add_foreign_key "oda_sagstrin", "oda_sager", column: "sag_id"
  add_foreign_key "oda_sagstrin", "oda_sagstrinsstatuser", column: "status_id"
  add_foreign_key "oda_sagstrin", "oda_sagstrinstyper", column: "type_id"
  add_foreign_key "oda_sagstrin_aktører", "oda_aktører", column: "aktør_id"
  add_foreign_key "oda_sagstrin_aktører", "oda_sagstrin", column: "sagstrin_id"
  add_foreign_key "oda_sagstrin_aktører", "oda_sagstrin_aktør_roller", column: "rolle_id"
  add_foreign_key "oda_sagstrin_dokumenter", "oda_dokumenter", column: "dokument_id"
  add_foreign_key "oda_sagstrin_dokumenter", "oda_sagstrin", column: "sagstrin_id"
  add_foreign_key "oda_sambehandlinger", "oda_sagstrin", column: "andetsagstrin_id"
  add_foreign_key "oda_sambehandlinger", "oda_sagstrin", column: "førstesagstrin_id"
  add_foreign_key "oda_slettets", "oda_slettet_maps", column: "slettetmap_id"
  add_foreign_key "oda_stemmer", "oda_afstemninger", column: "afstemning_id"
  add_foreign_key "oda_stemmer", "oda_aktører", column: "aktør_id"
  add_foreign_key "oda_stemmer", "oda_stemmetyper", column: "type_id"

  # Virtual tables defined in this database.
  # Note that virtual tables may not work with other database engines. Be careful if changing database.
  create_virtual_table "oda_sager_search_index", "fts5", ["titel", "titelkort", "resume", "content=oda_sager", "content_rowid=id"]
end
