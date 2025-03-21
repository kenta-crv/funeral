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

ActiveRecord::Schema.define(version: 2025_01_12_185032) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.string "kategory"
    t.string "description"
    t.string "heading_1"
    t.string "file_1"
    t.text "content_1"
    t.string "heading_2"
    t.string "file_2"
    t.text "content_2"
    t.string "heading_3"
    t.string "file_3"
    t.text "content_3"
    t.string "heading_4"
    t.string "file_4"
    t.text "content_4"
    t.string "heading_5"
    t.string "file_5"
    t.text "content_5"
    t.string "heading_6"
    t.string "file_6"
    t.text "content_6"
    t.string "heading_7"
    t.string "file_7"
    t.text "content_7"
    t.string "heading_8"
    t.string "file_8"
    t.text "content_8"
    t.string "heading_9"
    t.string "file_9"
    t.text "content_9"
    t.string "heading_10"
    t.string "file_10"
    t.text "content_10"
    t.string "heading_11"
    t.string "file_11"
    t.string "content_11"
    t.string "heading_12"
    t.string "file_12"
    t.string "content_12"
    t.string "heading_13"
    t.string "file_13"
    t.string "content_13"
    t.string "heading_14"
    t.string "file_14"
    t.string "content_14"
    t.string "heading_15"
    t.string "file_15"
    t.string "content_15"
    t.string "heading_16"
    t.string "file_16"
    t.string "content_16"
    t.string "heading_17"
    t.string "file_17"
    t.string "content_17"
    t.string "heading_18"
    t.string "file_18"
    t.string "content_18"
    t.string "heading_19"
    t.string "file_19"
    t.string "content_19"
    t.string "heading_20"
    t.string "file_20"
    t.string "content_20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "contract_id", null: false
    t.string "status"
    t.datetime "next"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_comments_on_contract_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.string "address"
    t.string "email"
    t.string "fenural"
    t.string "firty_nine"
    t.string "each_submit"
    t.string "each_cancel"
    t.string "card_cancel"
    t.string "hope_contact"
    t.string "inheritance"
    t.string "tidying_up"
    t.string "situation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment"
    t.string "salary"
    t.string "employment_conditions"
    t.string "document_screening"
    t.string "conversion"
    t.integer "work_id"
    t.string "cc"
    t.index ["work_id"], name: "index_contracts_on_work_id"
  end

  create_table "email_logs", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "contract_id", null: false
    t.datetime "sent_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_email_logs_on_contract_id"
    t.index ["work_id"], name: "index_email_logs_on_work_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "work_id", null: false
    t.string "status"
    t.datetime "next"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_progresses_on_work_id"
  end

  create_table "work_contracts", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "contract_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_work_contracts_on_contract_id"
    t.index ["work_id"], name: "index_work_contracts_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.string "address"
    t.string "email"
    t.string "program_histroy"
    t.string "program_python"
    t.string "program_other"
    t.string "period"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "age"
    t.string "education"
    t.string "histroy"
    t.string "work_now"
    t.string "engineer_level"
    t.string "nationality"
    t.string "japanese_level"
    t.string "conversion"
    t.string "visa"
    t.string "hope"
    t.string "recommendation"
    t.string "pr"
    t.string "qualification"
    t.string "image"
    t.boolean "introduced"
  end

end
