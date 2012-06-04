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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120602184652) do

  create_table "guests", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "show_id"
    t.integer  "tickets"
  end

  create_table "hosts", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "show_id"
  end

  create_table "shows", :force => true do |t|
    t.string   "location"
    t.integer  "host_id"
    t.integer  "user_id"
    t.integer  "ticket_price"
    t.integer  "tickets_min"
    t.integer  "tickets_max"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "tickets_sold", :default => 0
    t.date     "date"
    t.string   "web_string"
    t.string   "host_email"
  end

  add_index "shows", ["web_string"], :name => "index_shows_on_web_string", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "musician",        :default => true
    t.string   "header"
    t.string   "mp3_1_url"
    t.string   "mp3_2_url"
    t.string   "website"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
