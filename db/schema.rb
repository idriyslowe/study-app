# encoding: UTF-8
# This file is auto-generated from the current state of the database.If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations from scratch.

ActiveRecord::Schema.define(version: 20160120025519) do

  create_table "bookmarks", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "path",            limit: 255
    t.integer  "note_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "screenshot_data", limit: 65535
    t.integer  "user_id",         limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "text",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "note_page_id", limit: 4
  end

  create_table "environments", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "status",      limit: 255
    t.integer  "visit_count", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_path",  limit: 255
    t.boolean  "sharing"
  end

  create_table "note_pages", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.integer  "environment_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "summary",        limit: 255
  end

  create_table "notes", force: :cascade do |t|
    t.text     "text",         limit: 65535
    t.integer  "note_page_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "handle",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
