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

ActiveRecord::Schema.define(version: 20121231010454) do

  create_table "identities", force: true do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "account_type"
    t.integer  "account_id"
    t.string   "reset_token"
    t.string   "remember_token"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["remember_token"], name: "index_identities_on_remember_token"
  add_index "identities", ["reset_token"], name: "index_identities_on_reset_token"
  add_index "identities", ["uid"], name: "index_identities_on_uid"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "session_token"
    t.text     "dismissed_helpers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
