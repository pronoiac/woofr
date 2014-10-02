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

ActiveRecord::Schema.define(version: 20141002185642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "image_id",      null: false
    t.text     "body",          null: false
    t.integer  "image_user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["image_id"], name: "index_comments_on_image_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filepicker_url"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["image_id", "tag_id"], name: "index_taggings_on_image_id_and_tag_id", unique: true, using: :btree
  add_index "taggings", ["image_id"], name: "index_taggings_on_image_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.text     "username",        null: false
    t.text     "password_digest", null: false
    t.text     "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "guest"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
