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

ActiveRecord::Schema[7.0].define(version: 2023_02_23_112554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tutor_id"
    t.string "city"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id", "date"], name: "index_reservations_on_tutor_id_and_date", unique: true
  end

  create_table "tutors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "fb_link"
    t.string "ig_link"
    t.string "twitter_link"
    t.string "photo_url"
    t.integer "hourly_fee"
    t.integer "experience"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fb_link"], name: "index_tutors_on_fb_link", unique: true
    t.index ["ig_link"], name: "index_tutors_on_ig_link", unique: true
    t.index ["photo_url"], name: "index_tutors_on_photo_url", unique: true
    t.index ["twitter_link"], name: "index_tutors_on_twitter_link", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "reservations", "tutors", on_delete: :cascade
  add_foreign_key "reservations", "users", on_delete: :cascade
end
