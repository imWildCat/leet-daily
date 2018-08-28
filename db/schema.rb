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

ActiveRecord::Schema.define(version: 2018_08_28_133039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_site_configs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leetcode_user_checkins", force: :cascade do |t|
    t.bigint "leetcode_user_id"
    t.date "on_date"
    t.integer "finished_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leetcode_user_id", "on_date"], name: "index_leetcode_user_checkins_on_leetcode_user_id_and_on_date", unique: true
    t.index ["leetcode_user_id"], name: "index_leetcode_user_checkins_on_leetcode_user_id"
  end

  create_table "leetcode_users", force: :cascade do |t|
    t.string "leetcode_id", null: false
    t.bigint "user_id"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leetcode_id"], name: "index_leetcode_users_on_leetcode_id", unique: true
    t.index ["user_id"], name: "index_leetcode_users_on_user_id"
  end

  create_table "site_configs", force: :cascade do |t|
    t.string "key", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_groups_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest"
    t.bigint "user_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_group_id"], name: "index_users_on_user_group_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "leetcode_user_checkins", "leetcode_users"
  add_foreign_key "leetcode_users", "users"
  add_foreign_key "users", "user_groups"
end
