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

ActiveRecord::Schema.define(version: 20141205101727) do

  create_table "books", force: :cascade do |t|
    t.string   "isbn",              limit: 255
    t.string   "title",             limit: 255
    t.string   "author",            limit: 255
    t.text     "description",       limit: 65535
    t.integer  "pages",             limit: 4
    t.string   "cover_large_url",   limit: 255
    t.string   "cover_small_url",   limit: 255
    t.string   "publisher",         limit: 255
    t.date     "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 8
    t.datetime "logo_updated_at"
  end

  add_index "books", ["isbn"], name: "index_books_on_isbn", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "book_id",            limit: 4
    t.integer  "user_id",            limit: 4
    t.text     "content",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 8
    t.datetime "photo_updated_at"
  end

  create_table "user_books", force: :cascade do |t|
    t.integer  "book_id",             limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lend_to_user_id",     limit: 4
    t.integer  "borrow_from_user_id", limit: 4
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id", using: :btree
  add_index "user_books", ["borrow_from_user_id"], name: "index_user_books_on_borrow_from_user_id", using: :btree
  add_index "user_books", ["lend_to_user_id"], name: "index_user_books_on_lend_to_user_id", using: :btree
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "email",         limit: 255
    t.string   "avatar_url",    limit: 255
    t.string   "facebook_uid",  limit: 255
    t.string   "fb_token",      limit: 255
    t.string   "fb_expires_at", limit: 255
    t.string   "token",         limit: 255
    t.datetime "token_expired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["facebook_uid"], name: "index_users_on_facebook_uid", using: :btree

end
