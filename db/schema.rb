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

ActiveRecord::Schema.define(version: 2020_09_14_145530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.date "canceled_at"
    t.decimal "booking_price"
    t.date "accepted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "paid_at"
    t.bigint "subject_id"
    t.bigint "language_id"
    t.string "checkout_session_id"
    t.boolean "go_payment"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.index ["language_id"], name: "index_bookings_on_language_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
    t.index ["subject_id"], name: "index_bookings_on_subject_id"
    t.index ["tutor_id"], name: "index_bookings_on_tutor_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_chats_on_student_id"
    t.index ["tutor_id"], name: "index_chats_on_tutor_id"
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

  create_table "lessons", force: :cascade do |t|
    t.string "video_url"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "opentok_session_id"
    t.string "opentok_token"
    t.index ["booking_id"], name: "index_lessons_on_booking_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_student"
    t.bigint "author_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.bigint "booking_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
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
    t.index ["currency_id"], name: "index_tutors_on_currency_id"
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tutor_id"
    t.index ["tutor_id"], name: "index_wallets_on_tutor_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "languages"
  add_foreign_key "bookings", "students"
  add_foreign_key "bookings", "subjects"
  add_foreign_key "bookings", "tutors"
  add_foreign_key "chats", "students"
  add_foreign_key "chats", "tutors"
  add_foreign_key "comments", "job_posts"
  add_foreign_key "comments", "tutors"
  add_foreign_key "job_posts", "currencies"
  add_foreign_key "job_posts", "languages"
  add_foreign_key "job_posts", "students"
  add_foreign_key "job_posts", "subjects"
  add_foreign_key "lessons", "bookings"
  add_foreign_key "messages", "chats"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "spoken_languages", "languages"
  add_foreign_key "spoken_languages", "tutors"
  add_foreign_key "students", "wallets"
  add_foreign_key "taught_lessons", "subjects"
  add_foreign_key "taught_lessons", "tutors"
  add_foreign_key "tutors", "currencies"
  add_foreign_key "wallets", "tutors"
end
