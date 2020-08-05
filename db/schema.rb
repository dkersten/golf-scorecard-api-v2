# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_05_010021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scorecards", force: :cascade do |t|
    t.integer "user_id"
    t.json "f9_par"
    t.json "f9_score"
    t.json "b9_par"
    t.json "b9_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "course"
    t.integer "holes", default: 0
    t.integer "eagles", default: 0
    t.integer "birdies", default: 0
    t.integer "pars", default: 0
    t.integer "bogeys", default: 0
    t.integer "other_scores", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth0ID"
  end

end
