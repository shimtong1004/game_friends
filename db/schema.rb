# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160630063843) do

  create_table "games", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kakao_accounts", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.string   "account",    limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_true",                default: true
  end

  add_index "kakao_accounts", ["game_id", "is_true"], name: "index_kakao_accounts_on_game_id_and_is_true", using: :btree
  add_index "kakao_accounts", ["game_id"], name: "index_kakao_accounts_on_game_id", using: :btree

  create_table "user_copy_accounts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "account_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_copy_accounts", ["user_id"], name: "index_user_copy_accounts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "game_uniq_key", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "users", ["game_uniq_key"], name: "index_users_on_game_uniq_key", using: :btree

end
