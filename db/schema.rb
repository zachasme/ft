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
