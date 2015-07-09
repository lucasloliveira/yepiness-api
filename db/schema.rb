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

ActiveRecord::Schema.define(version: 20150709171837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendable_id"
    t.string   "friendable_type"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "provider"
    t.string   "uid",                    default: "", null: false
    t.text     "tokens"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "users_friends", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "friends_since"
    t.boolean  "accepted",      default: false
    t.boolean  "active",        default: true
  end

  create_table "yeps", force: :cascade do |t|
    t.text     "content"
    t.string   "title"
    t.string   "description"
    t.string   "shortUrl"
    t.string   "url"
    t.integer  "user_id"
    t.string   "image"
    t.boolean  "active",      default: true
    t.boolean  "seen",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  add_index "yeps", ["user_id"], name: "index_yeps_on_user_id", using: :btree

  create_table "yeps_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "yep_id"
  end

  add_index "yeps_users", ["user_id"], name: "index_yeps_users_on_user_id", using: :btree
  add_index "yeps_users", ["yep_id"], name: "index_yeps_users_on_yep_id", using: :btree

end
