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

ActiveRecord::Schema[8.0].define(version: 2024_06_10_062501) do
  create_table "bills", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.string "name"
    t.string "category"
    t.string "typename"
    t.string "status"
    t.string "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_bills_on_ftid", unique: true
  end

  create_table "decisions", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.integer "stage_id", null: false
    t.string "name", null: false
    t.string "comment"
    t.boolean "passed", null: false
    t.integer "number", null: false
    t.string "casetype", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_decisions_on_ftid", unique: true
    t.index ["stage_id"], name: "index_decisions_on_stage_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.integer "person_id", null: false
    t.integer "party_id", null: false
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_memberships_on_ftid", unique: true
    t.index ["party_id"], name: "index_memberships_on_party_id"
    t.index ["person_id"], name: "index_memberships_on_person_id"
  end

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
    t.index ["sagstrin_id"], name: "index_oda_afstemnings_on_sagstrin_id"
    t.index ["type_id"], name: "index_oda_afstemnings_on_type_id"
  end

  create_table "oda_afstemningstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_aktør_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
  end

  create_table "oda_aktør_aktørs", force: :cascade do |t|
    t.integer "fraaktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.integer "tilaktør_id"
    t.index ["fraaktør_id"], name: "index_oda_aktør_aktørs_on_fraaktør_id"
    t.index ["rolle_id"], name: "index_oda_aktør_aktørs_on_rolle_id"
    t.index ["tilaktør_id"], name: "index_oda_aktør_aktørs_on_tilaktør_id"
  end

  create_table "oda_aktørs", force: :cascade do |t|
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
  end

  create_table "oda_dagsordenspunkt_sags", force: :cascade do |t|
    t.integer "dagsordenspunkt_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["dagsordenspunkt_id"], name: "index_oda_dagsordenspunkt_sags_on_dagsordenspunkt_id"
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
    t.index ["sagstrin_id"], name: "index_oda_dagsordenspunkts_on_sagstrin_id"
    t.index ["super_id"], name: "index_oda_dagsordenspunkts_on_super_id"
  end

  create_table "oda_dokument_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
  end

  create_table "oda_dokument_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.index ["aktør_id"], name: "index_oda_dokument_aktørs_on_aktør_id"
    t.index ["dokument_id"], name: "index_oda_dokument_aktørs_on_dokument_id"
    t.index ["rolle_id"], name: "index_oda_dokument_aktørs_on_rolle_id"
  end

  create_table "oda_dokumentkategoris", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
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
    t.string "titel"
    t.integer "type_id"
    t.index ["kategori_id"], name: "index_oda_dokuments_on_kategori_id"
    t.index ["spørgsmåls_id"], name: "index_oda_dokuments_on_spørgsmåls_id"
    t.index ["status_id"], name: "index_oda_dokuments_on_status_id"
    t.index ["type_id"], name: "index_oda_dokuments_on_type_id"
  end

  create_table "oda_dokumentstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
  end

  create_table "oda_dokumenttypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_emneord_dokuments", force: :cascade do |t|
    t.integer "dokument_id"
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_emneord_dokuments_on_dokument_id"
    t.index ["emneord_id"], name: "index_oda_emneord_dokuments_on_emneord_id"
  end

  create_table "oda_emneord_sags", force: :cascade do |t|
    t.integer "emneord_id"
    t.datetime "opdateringsdato"
    t.integer "sag_id"
    t.index ["emneord_id"], name: "index_oda_emneord_sags_on_emneord_id"
    t.index ["sag_id"], name: "index_oda_emneord_sags_on_sag_id"
  end

  create_table "oda_emneords", force: :cascade do |t|
    t.string "emneord"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.index ["type_id"], name: "index_oda_emneords_on_type_id"
  end

  create_table "oda_emneordstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_entitet_beskrivelses", force: :cascade do |t|
    t.string "entitetnavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
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
  end

  create_table "oda_id_maps", force: :cascade do |t|
    t.string "originalid"
    t.string "entity"
  end

  create_table "oda_kolonne_beskrivelses", force: :cascade do |t|
    t.string "entitetsnavn"
    t.string "kolonnenavn"
    t.string "beskrivelse"
    t.datetime "opdateringsdato"
  end

  create_table "oda_møde_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.integer "møde_id"
    t.datetime "opdateringsdato"
    t.index ["aktør_id"], name: "index_oda_møde_aktørs_on_aktør_id"
    t.index ["møde_id"], name: "index_oda_møde_aktørs_on_møde_id"
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
    t.index ["periode_id"], name: "index_oda_mødes_on_periode_id"
    t.index ["status_id"], name: "index_oda_mødes_on_status_id"
    t.index ["type_id"], name: "index_oda_mødes_on_type_id"
  end

  create_table "oda_mødestatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
  end

  create_table "oda_mødetypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "oda_omtryks", force: :cascade do |t|
    t.string "begrundelse"
    t.datetime "dato"
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.index ["dokument_id"], name: "index_oda_omtryks_on_dokument_id"
  end

  create_table "oda_periodes", force: :cascade do |t|
    t.string "kode"
    t.datetime "opdateringsdato"
    t.datetime "slutdato"
    t.datetime "startdato"
    t.string "titel"
    t.string "typenavn"
  end

  create_table "oda_sag_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
  end

  create_table "oda_sag_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["aktør_id"], name: "index_oda_sag_aktørs_on_aktør_id"
    t.index ["rolle_id"], name: "index_oda_sag_aktørs_on_rolle_id"
    t.index ["sag_id"], name: "index_oda_sag_aktørs_on_sag_id"
  end

  create_table "oda_sag_dokument_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
  end

  create_table "oda_sag_dokuments", force: :cascade do |t|
    t.string "bilagsnummer"
    t.integer "dokument_id"
    t.datetime "frigivelsesdato"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sag_id"
    t.index ["dokument_id"], name: "index_oda_sag_dokuments_on_dokument_id"
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
    t.string "titel"
    t.string "titelkort"
    t.integer "type_id"
    t.index ["deltundersag_id"], name: "index_oda_sags_on_deltundersag_id"
    t.index ["fremsatundersag_id"], name: "index_oda_sags_on_fremsatundersag_id"
    t.index ["kategori_id"], name: "index_oda_sags_on_kategori_id"
    t.index ["periode_id"], name: "index_oda_sags_on_periode_id"
    t.index ["status_id"], name: "index_oda_sags_on_status_id"
    t.index ["type_id"], name: "index_oda_sags_on_type_id"
  end

  create_table "oda_sagskategoris", force: :cascade do |t|
    t.string "kategori"
    t.datetime "opdateringsdato"
  end

  create_table "oda_sagsstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
  end

  create_table "oda_sagstrin_aktør_rolles", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "rolle"
  end

  create_table "oda_sagstrin_aktørs", force: :cascade do |t|
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "rolle_id"
    t.integer "sagstrin_id"
    t.index ["aktør_id"], name: "index_oda_sagstrin_aktørs_on_aktør_id"
    t.index ["rolle_id"], name: "index_oda_sagstrin_aktørs_on_rolle_id"
    t.index ["sagstrin_id"], name: "index_oda_sagstrin_aktørs_on_sagstrin_id"
  end

  create_table "oda_sagstrin_dokuments", force: :cascade do |t|
    t.integer "dokument_id"
    t.datetime "opdateringsdato"
    t.integer "sagstrin_id"
    t.index ["dokument_id"], name: "index_oda_sagstrin_dokuments_on_dokument_id"
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
    t.index ["sag_id"], name: "index_oda_sagstrins_on_sag_id"
    t.index ["status_id"], name: "index_oda_sagstrins_on_status_id"
    t.index ["type_id"], name: "index_oda_sagstrins_on_type_id"
  end

  create_table "oda_sagstrinsstatuses", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "status"
  end

  create_table "oda_sagstrinstypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
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
  end

  create_table "oda_stemmes", force: :cascade do |t|
    t.integer "afstemning_id"
    t.integer "aktør_id"
    t.datetime "opdateringsdato"
    t.integer "type_id"
    t.index ["afstemning_id"], name: "index_oda_stemmes_on_afstemning_id"
    t.index ["aktør_id"], name: "index_oda_stemmes_on_aktør_id"
    t.index ["type_id"], name: "index_oda_stemmes_on_type_id"
  end

  create_table "oda_stemmetypes", force: :cascade do |t|
    t.datetime "opdateringsdato"
    t.string "typenavn"
  end

  create_table "parties", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.string "name"
    t.string "abbreviation"
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_parties_on_ftid", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.string "name"
    t.string "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_people_on_ftid", unique: true
  end

  create_table "slettet_maps", force: :cascade do |t|
    t.string "datatype"
    t.datetime "opdateringsdato"
  end

  create_table "slettets", force: :cascade do |t|
    t.integer "slettetmap_id"
    t.datetime "opdateringsdato"
    t.string "objektid"
    t.index ["slettetmap_id"], name: "index_slettets_on_slettetmap_id"
  end

  create_table "stages", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.integer "bill_id", null: false
    t.string "typename"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_stages_on_bill_id"
    t.index ["ftid"], name: "index_stages_on_ftid", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "ftid"
    t.date "ftts", null: false
    t.integer "decision_id", null: false
    t.integer "voter_id", null: false
    t.integer "what", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_id"], name: "index_votes_on_decision_id"
    t.index ["ftid"], name: "index_votes_on_ftid", unique: true
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "decisions", "stages"
  add_foreign_key "memberships", "parties"
  add_foreign_key "memberships", "people"
  add_foreign_key "stages", "bills"
  add_foreign_key "votes", "decisions"
  add_foreign_key "votes", "people", column: "voter_id"
end
