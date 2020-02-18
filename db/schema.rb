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

ActiveRecord::Schema.define(version: 2020_02_12_190433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.date "canceled_at"
    t.datetime "start_date"
    t.decimal "booking_price"
    t.date "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "paid_at"
    t.bigint "subject_id"
    t.bigint "language_id"
    t.datetime "end_date"
    t.string "checkout_session_id"
    t.boolean "go_payment"
    t.index ["language_id"], name: "index_bookings_on_language_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
    t.index ["subject_id"], name: "index_bookings_on_subject_id"
    t.index ["tutor_id"], name: "index_bookings_on_tutor_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "job_post_id"
    t.bigint "tutor_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_post_id"], name: "index_comments_on_job_post_id"
    t.index ["tutor_id"], name: "index_comments_on_tutor_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.bigint "student_id"
    t.string "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.bigint "subject_id"
    t.bigint "language_id"
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_job_posts_on_currency_id"
    t.index ["language_id"], name: "index_job_posts_on_language_id"
    t.index ["student_id"], name: "index_job_posts_on_student_id"
    t.index ["subject_id"], name: "index_job_posts_on_subject_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "language_id"
    t.bigint "tutor_id"
    t.index ["language_id"], name: "index_spoken_languages_on_language_id"
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
    t.bigint "wallet_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["wallet_id"], name: "index_students_on_wallet_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taught_lessons", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_taught_lessons_on_subject_id"
    t.index ["tutor_id"], name: "index_taught_lessons_on_tutor_id"
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
    t.decimal "price"
    t.string "country"
    t.string "photo_url"
    t.time "average_response_time"
    t.date "validated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.bigint "currency_id"
    t.bigint "wallet_id"
    t.index ["currency_id"], name: "index_tutors_on_currency_id"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
    t.index ["wallet_id"], name: "index_tutors_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
  end

  add_foreign_key "bookings", "languages"
  add_foreign_key "bookings", "students"
  add_foreign_key "bookings", "subjects"
  add_foreign_key "bookings", "tutors"
  add_foreign_key "comments", "job_posts"
  add_foreign_key "comments", "tutors"
  add_foreign_key "job_posts", "currencies"
  add_foreign_key "job_posts", "languages"
  add_foreign_key "job_posts", "students"
  add_foreign_key "job_posts", "subjects"
  add_foreign_key "spoken_languages", "languages"
  add_foreign_key "spoken_languages", "tutors"
  add_foreign_key "students", "wallets"
  add_foreign_key "taught_lessons", "subjects"
  add_foreign_key "taught_lessons", "tutors"
  add_foreign_key "tutors", "currencies"
  add_foreign_key "tutors", "wallets"
  add_foreign_key "wallets", "currencies"
end
