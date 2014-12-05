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

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.integer  "pages"
    t.string   "cover_large_url"
    t.string   "cover_small_url"
    t.string   "publisher"
    t.date     "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "books", ["isbn"], name: "index_books_on_isbn", unique: true

  create_table "comments", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "user_books", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lend_to_user_id"
    t.integer  "borrow_from_user_id"
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id"
  add_index "user_books", ["borrow_from_user_id"], name: "index_user_books_on_borrow_from_user_id"
  add_index "user_books", ["lend_to_user_id"], name: "index_user_books_on_lend_to_user_id"
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar_url"
    t.string   "facebook_uid"
    t.string   "fb_token"
    t.string   "fb_expires_at"
    t.string   "token"
    t.datetime "token_expired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["facebook_uid"], name: "index_users_on_facebook_uid"

end
