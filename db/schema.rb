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

ActiveRecord::Schema.define(version: 20150708121635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trap_requests", force: :cascade do |t|
    t.integer  "trap_id"
    t.string   "remote_ip",      limit: 45
    t.string   "request_method", limit: 8
    t.string   "scheme",         limit: 8
    t.text     "query_string"
    t.text     "query_params"
    t.text     "cookies"
    t.text     "headers"
    t.text     "response"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "trap_requests", ["trap_id"], name: "index_trap_requests_on_trap_id", using: :btree

  create_table "traps", force: :cascade do |t|
    t.string   "uri",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "traps", ["uri"], name: "index_traps_on_uri", using: :btree

  add_foreign_key "trap_requests", "traps"
end
