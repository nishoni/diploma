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

ActiveRecord::Schema[7.0].define(version: 2024_04_07_173155) do
  create_table "db_versions", force: :cascade do |t|
    t.integer "version", null: false
    t.integer "new_items_created", default: 0
    t.boolean "current", default: true, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_db_versions_on_user_id"
  end

  create_table "queries", force: :cascade do |t|
    t.string "word", null: false
    t.datetime "time_start"
    t.datetime "time_stop"
    t.string "search_errors"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_queries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "coefficient", default: 0.6, null: false
    t.integer "max_result_count", default: 10, null: false
  end

  create_table "xml_items", force: :cascade do |t|
    t.string "gender"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "aliases"
    t.text "roles"
    t.text "addresses"
    t.integer "csl_id", null: false
    t.text "place_of_birth"
    t.integer "db_version_id"
    t.index ["db_version_id"], name: "index_xml_items_on_db_version_id"
  end

  add_foreign_key "db_versions", "users"
  add_foreign_key "queries", "users"
  add_foreign_key "xml_items", "db_versions"
end
