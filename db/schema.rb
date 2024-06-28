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

ActiveRecord::Schema[8.0].define(version: 2024_06_28_122552) do
  create_table "oda_afstemnings", force: :cascade do |t|
    t.string "kommentar"
    t.string "konklusion"
    t.integer "møde_id"
    t.integer "nummer"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.integer "type_id"
    t.boolean "vedtaget"
    t.index ["møde_id"], name: "index_oda_afstemnings_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_afstemnings_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_afstemnings_on_sagstrin_id"
    t.index ["type_id"], name: "index_oda_afstemnings_on_type_id"
  end

  create_table "oda_afstemningstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_afstemningstypes_on_opdateringsdato"
  end

  create_table "oda_aktør_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_aktør_aktør_rolles_on_opdateringsdato"
  end

  create_table "oda_aktør_aktørs", force: :cascade do |t|
    t.integer "fraaktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "tilaktør_id"
    t.index ["fraaktør_id"], name: "index_oda_aktør_aktørs_on_fraaktør_id"
    t.index ["opdateringsdato"], name: "index_oda_aktør_aktørs_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_aktør_aktørs_on_rolle_id"
    t.index ["tilaktør_id"], name: "index_oda_aktør_aktørs_on_tilaktør_id"
  end

  create_table "oda_aktørs", force: :cascade do |t|
    t.string "biografi"
    t.string "efternavn"
    t.string "fornavn"
    t.string "gruppenavnkort"
    t.string "navn", collation: "nocase"
    t.datetime "opdateringsdato"
    t.integer "periode_id"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "type_id"
    t.index ["navn"], name: "index_oda_aktørs_on_navn"
    t.index ["opdateringsdato"], name: "index_oda_aktørs_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_aktørs_on_periode_id"
    t.index ["type_id"], name: "index_oda_aktørs_on_type_id"
  end

  create_table "oda_aktørtypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_dagsordenspunkt_dokuments", force: :cascade do |t|
    t.integer "dagsordenspunkt_id"
    t.integer "dokument_id"
    t.string "note"
    t.datetime "opdateringsdato"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_dokuments_on_dagsordenspunkt_id"
    t.index ["dokument_id"], name: "index_oda_dagsordenspunkt_dokuments_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_dokuments_on_opdateringsdato"
  end

  create_table "oda_dagsordenspunkt_sags", force: :cascade do |t|
    t.integer "dagsordenspunkt_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_sags_on_dagsordenspunkt_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkt_sags_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_dagsordenspunkt_sags_on_sag_id"
  end

  create_table "oda_dagsordenspunkts", force: :cascade do |t|
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
    t.index ["møde_id"], name: "index_oda_dagsordenspunkts_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_dagsordenspunkts_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_dagsordenspunkts_on_sagstrin_id"
    t.index ["super_id"], name: "index_oda_dagsordenspunkts_on_super_id"
  end

  create_table "oda_dokument_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_dokument_aktør_rolles_on_opdateringsdato"
  end

  create_table "oda_dokument_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.index ["aktør_id"], name: "index_oda_dokument_aktørs_on_aktør_id"
    t.index ["dokument_id"], name: "index_oda_dokument_aktørs_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_dokument_aktørs_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_dokument_aktørs_on_rolle_id"
  end

  create_table "oda_dokumentkategoris", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_dokumentkategoris_on_opdateringsdato"
  end

  create_table "oda_dokuments", force: :cascade do |t|
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
    t.string "titel", collation: "nocase"
    t.integer "type_id"
    t.index ["dato"], name: "index_oda_dokuments_on_dato"
    t.index ["kategori_id"], name: "index_oda_dokuments_on_kategori_id"
    t.index ["opdateringsdato"], name: "index_oda_dokuments_on_opdateringsdato"
    t.index ["spørgsmåls_id"], name: "index_oda_dokuments_on_spørgsmåls_id"
    t.index ["status_id"], name: "index_oda_dokuments_on_status_id"
    t.index ["titel"], name: "index_oda_dokuments_on_titel"
    t.index ["type_id"], name: "index_oda_dokuments_on_type_id"
  end

  create_table "oda_dokumentstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_dokumentstatuses_on_opdateringsdato"
  end

  create_table "oda_dokumenttypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_dokumenttypes_on_opdateringsdato"
  end

  create_table "oda_emneord_dokuments", force: :cascade do |t|
    t.integer "dokument_id"
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_emneord_dokuments_on_dokument_id"
    t.index ["emneord_id"], name: "index_oda_emneord_dokuments_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_dokuments_on_opdateringsdato"
  end

  create_table "oda_emneord_sags", force: :cascade do |t|
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["emneord_id"], name: "index_oda_emneord_sags_on_emneord_id"
    t.index ["opdateringsdato"], name: "index_oda_emneord_sags_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_emneord_sags_on_sag_id"
  end

  create_table "oda_emneords", force: :cascade do |t|
    t.string "emneord", collation: "nocase"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.integer "emneord_sags_count", default: 0
    t.integer "emneord_dokuments_count", default: 0
    t.index ["emneord"], name: "index_oda_emneords_on_emneord"
    t.index ["emneord_sags_count"], name: "index_oda_emneords_on_emneord_sags_count"
    t.index ["opdateringsdato"], name: "index_oda_emneords_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_emneords_on_type_id"
  end

  create_table "oda_emneordstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_emneordstypes_on_opdateringsdato"
  end

  create_table "oda_entitet_beskrivelses", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_entitet_beskrivelses_on_opdateringsdato"
  end

  create_table "oda_fils", force: :cascade do |t|
    t.integer "dokument_id"
    t.string "filurl"
    t.string "format"
    t.datetime "opdateringsdato"
    t.string "titel"
    t.string "variantkode"
    t.datetime "versionsdato"
    t.index ["dokument_id"], name: "index_oda_fils_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_fils_on_opdateringsdato"
  end

  create_table "oda_id_maps", force: :cascade do |t|
    t.string "original_id"
    t.string "entity"
  end

  create_table "oda_kollone_beskrivelses", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "kollonenavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_kollone_beskrivelses_on_opdateringsdato"
  end

  create_table "oda_møde_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "møde_id"
    t.datetime "opdateringsdato"
    t.index ["aktør_id"], name: "index_oda_møde_aktørs_on_aktør_id"
    t.index ["møde_id"], name: "index_oda_møde_aktørs_on_møde_id"
    t.index ["opdateringsdato"], name: "index_oda_møde_aktørs_on_opdateringsdato"
  end

  create_table "oda_mødes", force: :cascade do |t|
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
    t.index ["dato"], name: "index_oda_mødes_on_dato"
    t.index ["opdateringsdato"], name: "index_oda_mødes_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_mødes_on_periode_id"
    t.index ["status_id"], name: "index_oda_mødes_on_status_id"
    t.index ["type_id"], name: "index_oda_mødes_on_type_id"
  end

  create_table "oda_mødestatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_mødestatuses_on_opdateringsdato"
  end

  create_table "oda_mødetypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_mødetypes_on_opdateringsdato"
  end

  create_table "oda_omtryks", force: :cascade do |t|
    t.string "begrundelse"
    t.datetime "dato"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_omtryks_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_omtryks_on_opdateringsdato"
  end

  create_table "oda_periodes", force: :cascade do |t|
    t.string "kode"
    t.datetime "opdateringsdato"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.string "titel"
    t.string "typenavn"
    t.integer "aktørs_count", default: 0
    t.integer "mødes_count", default: 0
    t.integer "sags_count", default: 0
    t.index ["kode"], name: "index_oda_periodes_on_kode"
    t.index ["opdateringsdato"], name: "index_oda_periodes_on_opdateringsdato"
  end

  create_table "oda_sag_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktør_rolles_on_opdateringsdato"
  end

  create_table "oda_sag_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["aktør_id"], name: "index_oda_sag_aktørs_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sag_aktørs_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sag_aktørs_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_aktørs_on_sag_id"
  end

  create_table "oda_sag_dokument_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sag_dokument_rolles_on_opdateringsdato"
  end

  create_table "oda_sag_dokuments", force: :cascade do |t|
    t.string "bilagsnummer"
    t.integer "dokument_id"
    t.datetime "frigivelsesdato"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["dokument_id"], name: "index_oda_sag_dokuments_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_sag_dokuments_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sag_dokuments_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_dokuments_on_sag_id"
  end

  create_table "oda_sags", force: :cascade do |t|
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
    t.string "titel", collation: "nocase"
    t.string "titelkort"
    t.integer "type_id"
    t.index ["deltundersag_id"], name: "index_oda_sags_on_deltundersag_id"
    t.index ["fremsatundersag_id"], name: "index_oda_sags_on_fremsatundersag_id"
    t.index ["kategori_id"], name: "index_oda_sags_on_kategori_id"
    t.index ["nummernumerisk"], name: "index_oda_sags_on_nummernumerisk"
    t.index ["opdateringsdato"], name: "index_oda_sags_on_opdateringsdato"
    t.index ["periode_id"], name: "index_oda_sags_on_periode_id"
    t.index ["status_id"], name: "index_oda_sags_on_status_id"
    t.index ["titel"], name: "index_oda_sags_on_titel"
    t.index ["type_id"], name: "index_oda_sags_on_type_id"
  end

  create_table "oda_sagskategoris", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_sagskategoris_on_opdateringsdato"
  end

  create_table "oda_sagsstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_sagsstatuses_on_opdateringsdato"
  end

  create_table "oda_sagstrin_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktør_rolles_on_opdateringsdato"
  end

  create_table "oda_sagstrin_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sagstrin_id"
    t.index ["aktør_id"], name: "index_oda_sagstrin_aktørs_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_aktørs_on_opdateringsdato"
    t.index ["rolle_id"], name: "index_oda_sagstrin_aktørs_on_rolle_id"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_aktørs_on_sagstrin_id"
  end

  create_table "oda_sagstrin_dokuments", force: :cascade do |t|
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.index ["dokument_id"], name: "index_oda_sagstrin_dokuments_on_dokument_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrin_dokuments_on_opdateringsdato"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_dokuments_on_sagstrin_id"
  end

  create_table "oda_sagstrins", force: :cascade do |t|
    t.datetime "dato"
    t.string "folketingstidende"
    t.string "folketingstidendesidenummer"
    t.string "folketingstidendeurl"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.integer "status_id"
    t.string "titel"
    t.integer "type_id"
    t.index ["opdateringsdato"], name: "index_oda_sagstrins_on_opdateringsdato"
    t.index ["sag_id"], name: "index_oda_sagstrins_on_sag_id"
    t.index ["status_id"], name: "index_oda_sagstrins_on_status_id"
    t.index ["type_id"], name: "index_oda_sagstrins_on_type_id"
  end

  create_table "oda_sagstrinsstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinsstatuses_on_opdateringsdato"
  end

  create_table "oda_sagstrinstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_sagstrinstypes_on_opdateringsdato"
  end

  create_table "oda_sagstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_sambehandlingers", force: :cascade do |t|
    t.integer "andetsagstrin_id"
    t.integer "førstesagstrin_id"
    t.datetime "opdateringsdato"
    t.index ["andetsagstrin_id"], name: "index_oda_sambehandlingers_on_andetsagstrin_id"
    t.index ["førstesagstrin_id"], name: "index_oda_sambehandlingers_on_førstesagstrin_id"
    t.index ["opdateringsdato"], name: "index_oda_sambehandlingers_on_opdateringsdato"
  end

  create_table "oda_slettet_maps", force: :cascade do |t|
    t.string "datatype"
    t.datetime "opdateringsdato"
    t.index ["opdateringsdato"], name: "index_oda_slettet_maps_on_opdateringsdato"
  end

  create_table "oda_slettets", force: :cascade do |t|
    t.integer "slettetmap_id"
    t.datetime "opdateringsdato"
    t.string "objekt_id"
    t.index ["opdateringsdato"], name: "index_oda_slettets_on_opdateringsdato"
    t.index ["slettetmap_id"], name: "index_oda_slettets_on_slettetmap_id"
  end

  create_table "oda_stemmes", force: :cascade do |t|
    t.integer "afstemning_id"
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.index ["afstemning_id"], name: "index_oda_stemmes_on_afstemning_id"
    t.index ["aktør_id"], name: "index_oda_stemmes_on_aktør_id"
    t.index ["opdateringsdato"], name: "index_oda_stemmes_on_opdateringsdato"
    t.index ["type_id"], name: "index_oda_stemmes_on_type_id"
  end

  create_table "oda_stemmetypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
    t.index ["opdateringsdato"], name: "index_oda_stemmetypes_on_opdateringsdato"
  end

  create_table "solid_queue_blocked_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.string "concurrency_key", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.index ["concurrency_key", "priority", "job_id"], name: "index_solid_queue_blocked_executions_for_release"
    t.index ["expires_at", "concurrency_key"], name: "index_solid_queue_blocked_executions_for_maintenance"
    t.index ["job_id"], name: "index_solid_queue_blocked_executions_on_job_id", unique: true
  end

  create_table "solid_queue_claimed_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.bigint "process_id"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_claimed_executions_on_job_id", unique: true
    t.index ["process_id", "job_id"], name: "index_solid_queue_claimed_executions_on_process_id_and_job_id"
  end

  create_table "solid_queue_failed_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.text "error"
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_failed_executions_on_job_id", unique: true
  end

  create_table "solid_queue_jobs", force: :cascade do |t|
    t.string "queue_name", null: false
    t.string "class_name", null: false
    t.text "arguments"
    t.integer "priority", default: 0, null: false
    t.string "active_job_id"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.string "concurrency_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_job_id"], name: "index_solid_queue_jobs_on_active_job_id"
    t.index ["class_name"], name: "index_solid_queue_jobs_on_class_name"
    t.index ["finished_at"], name: "index_solid_queue_jobs_on_finished_at"
    t.index ["queue_name", "finished_at"], name: "index_solid_queue_jobs_for_filtering"
    t.index ["scheduled_at", "finished_at"], name: "index_solid_queue_jobs_for_alerting"
  end

  create_table "solid_queue_pauses", force: :cascade do |t|
    t.string "queue_name", null: false
    t.datetime "created_at", null: false
    t.index ["queue_name"], name: "index_solid_queue_pauses_on_queue_name", unique: true
  end

  create_table "solid_queue_processes", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "last_heartbeat_at", null: false
    t.bigint "supervisor_id"
    t.integer "pid", null: false
    t.string "hostname"
    t.text "metadata"
    t.datetime "created_at", null: false
    t.index ["last_heartbeat_at"], name: "index_solid_queue_processes_on_last_heartbeat_at"
    t.index ["supervisor_id"], name: "index_solid_queue_processes_on_supervisor_id"
  end

  create_table "solid_queue_ready_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_ready_executions_on_job_id", unique: true
    t.index ["priority", "job_id"], name: "index_solid_queue_poll_all"
    t.index ["queue_name", "priority", "job_id"], name: "index_solid_queue_poll_by_queue"
  end

  create_table "solid_queue_recurring_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "task_key", null: false
    t.datetime "run_at", null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_recurring_executions_on_job_id", unique: true
    t.index ["task_key", "run_at"], name: "index_solid_queue_recurring_executions_on_task_key_and_run_at", unique: true
  end

  create_table "solid_queue_scheduled_executions", force: :cascade do |t|
    t.integer "job_id", null: false
    t.string "queue_name", null: false
    t.integer "priority", default: 0, null: false
    t.datetime "scheduled_at", null: false
    t.datetime "created_at", null: false
    t.index ["job_id"], name: "index_solid_queue_scheduled_executions_on_job_id", unique: true
    t.index ["scheduled_at", "priority", "job_id"], name: "index_solid_queue_dispatch_all"
  end

  create_table "solid_queue_semaphores", force: :cascade do |t|
    t.string "key", null: false
    t.integer "value", default: 1, null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expires_at"], name: "index_solid_queue_semaphores_on_expires_at"
    t.index ["key", "value"], name: "index_solid_queue_semaphores_on_key_and_value"
    t.index ["key"], name: "index_solid_queue_semaphores_on_key", unique: true
  end

  add_foreign_key "solid_queue_blocked_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_claimed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_failed_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_ready_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_recurring_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
  add_foreign_key "solid_queue_scheduled_executions", "solid_queue_jobs", column: "job_id", on_delete: :cascade
end
