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
  create_table "decisions", force: :cascade do |t|
    t.integer "ftid"
    t.string "name"
    t.string "comment"
    t.boolean "passed"
    t.integer "number"
    t.string "casetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_decisions_on_ftid", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.integer "ftid"
    t.string "name"
    t.string "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ftid"], name: "index_people_on_ftid", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "ftid"
    t.integer "decision_id"
    t.integer "voter_id"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decision_id"], name: "index_votes_on_decision_id"
    t.index ["ftid"], name: "index_votes_on_ftid", unique: true
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "votes", "decisions"
  add_foreign_key "votes", "people", column: "voter_id"
end
