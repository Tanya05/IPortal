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

ActiveRecord::Schema.define(version: 20161121202324) do

  create_table "contract_details", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "percentage",  limit: 24
    t.integer  "contract_id", limit: 4
    t.integer  "user_id",     limit: 4
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "type",       limit: 255
    t.integer  "ip_id",      limit: 4
  end

  create_table "ips", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "title",           limit: 255,   default: "", null: false
    t.text     "description",     limit: 65535
    t.text     "owners",          limit: 65535
    t.text     "Type",            limit: 65535,              null: false
    t.string   "uploads",         limit: 255
    t.integer  "no_of_approvals", limit: 4,     default: 0
  end

  create_table "labs", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",        limit: 255,   null: false
    t.text     "keywords",    limit: 65535
    t.text     "description", limit: 65535
    t.text     "members",     limit: 65535
  end

  create_table "stakeholders", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "percentage", limit: 24, default: 0.0
    t.integer  "ip_id",      limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "attachment", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "bio",                    limit: 65535
    t.string   "name",                   limit: 255
    t.string   "type",                   limit: 255
    t.integer  "flag",                   limit: 4
    t.boolean  "isIIITB",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
