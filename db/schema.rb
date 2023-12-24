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

ActiveRecord::Schema[7.0].define(version: 2023_12_24_034549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "is_active", default: 0
    t.string "owner", limit: 50, null: false
    t.string "main_office", limit: 100
    t.string "phone", limit: 15
    t.uuid "country_id", null: false
    t.integer "company_type", default: 0, null: false
    t.integer "company_size", default: 1, null: false
    t.float "avg_score"
    t.integer "total_reviews", default: 0
    t.boolean "is_good_company", default: true
    t.string "logo", limit: 255
    t.string "website", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "company_id"
    t.integer "score", default: 0, null: false
    t.string "title", limit: 100
    t.text "reviews_content"
    t.boolean "vote_for_quit", default: false, null: false
    t.boolean "vote_for_work", default: true, null: false
    t.boolean "is_anonymous", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
