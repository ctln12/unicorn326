# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_07_144142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tutor_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_spoken_languages_on_student_id"
    t.index ["tutor_id"], name: "index_spoken_languages_on_tutor_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "country"
    t.date "date_of_birth"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "wallets_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["wallets_id"], name: "index_students_on_wallets_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "currency"
    t.float "price"
    t.string "country"
    t.string "photo_url"
    t.time "average_response_time"
    t.date "validated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.bigint "subjects_id"
    t.bigint "spoken_languages_id"
    t.bigint "wallets_id"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
    t.index ["spoken_languages_id"], name: "index_tutors_on_spoken_languages_id"
    t.index ["subjects_id"], name: "index_tutors_on_subjects_id"
    t.index ["wallets_id"], name: "index_tutors_on_wallets_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.float "amount"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "spoken_languages", "students"
  add_foreign_key "spoken_languages", "tutors"
  add_foreign_key "students", "wallets", column: "wallets_id"
  add_foreign_key "tutors", "spoken_languages", column: "spoken_languages_id"
  add_foreign_key "tutors", "subjects", column: "subjects_id"
  add_foreign_key "tutors", "wallets", column: "wallets_id"
end
