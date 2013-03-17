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

ActiveRecord::Schema.define(version: 20130309011341) do

  create_table "events", force: true do |t|
    t.string   "adapt_url"
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.string   "image_hlarge"
    t.string   "image_lmobile"
    t.string   "geo"
    t.string   "address"
    t.string   "album"
    t.integer  "participant_count"
    t.integer  "wisher_count"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner_id"
  end

  create_table "participation_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "participation_users", ["event_id"], name: "index_participation_users_on_event_id"
  add_index "participation_users", ["user_id"], name: "index_participation_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "avatar"
    t.string   "signature"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wish_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "wish_users", ["event_id"], name: "index_wish_users_on_event_id"
  add_index "wish_users", ["user_id"], name: "index_wish_users_on_user_id"

end
