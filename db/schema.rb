# encoding: UTF-8

ActiveRecord::Schema.define(version: 20160215181601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "note_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "screenshot_data"
    t.integer  "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "note_page_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "visit_count"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "sharing"
    t.string   "image_path"
  end

  create_table "note_pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "environment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "summary"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "text"
    t.integer  "note_page_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "handle"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
