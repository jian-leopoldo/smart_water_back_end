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

ActiveRecord::Schema.define(version: 2018_11_20_020512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alert_messages", force: :cascade do |t|
    t.integer "alert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alerts", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.integer "monitoring_point_id"
    t.float "max_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alert_type"
  end

  create_table "locales", force: :cascade do |t|
    t.string "title"
    t.text "address"
    t.string "type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "monitoring_logs", force: :cascade do |t|
    t.integer "monitoring_point_id"
    t.float "point_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "current_value"
  end

  create_table "monitoring_points", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "locale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monitoringpoints", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "locale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
