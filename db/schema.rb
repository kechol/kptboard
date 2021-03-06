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

ActiveRecord::Schema.define(version: 20140112124943) do

  create_table "labels", force: true do |t|
    t.string   "typ",              null: false
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retrospective_id", null: false
    t.integer  "user_id"
  end

  add_index "labels", ["retrospective_id"], name: "index_labels_on_retrospective_id", using: :btree
  add_index "labels", ["user_id"], name: "index_labels_on_user_id", using: :btree

  create_table "retrospective_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retrospective_id", null: false
    t.integer  "user_id",          null: false
  end

  add_index "retrospective_users", ["retrospective_id", "user_id"], name: "index_retrospective_users_on_retrospective_id_and_user_id", unique: true, using: :btree
  add_index "retrospective_users", ["retrospective_id"], name: "index_retrospective_users_on_retrospective_id", using: :btree
  add_index "retrospective_users", ["user_id"], name: "index_retrospective_users_on_user_id", using: :btree

  create_table "retrospectives", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "retrospectives", ["title"], name: "index_retrospectives_on_title", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
