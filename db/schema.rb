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

ActiveRecord::Schema.define(:version => 20120702203839) do

  create_table "admins", :force => true do |t|
    t.float    "cost_percentage"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "max_travel_radius"
    t.integer  "default_fan_travel_radius"
  end

  create_table "availabilities", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.integer  "travel_radius"
  end

  create_table "guests", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "show_id"
    t.integer  "tickets",           :default => 0
    t.boolean  "interested"
    t.float    "cost"
    t.text     "ticket_emails"
    t.integer  "tickets_requested"
  end

  create_table "hosts", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "show_id"
  end

  add_index "hosts", ["show_id"], :name => "index_hosts_on_show_id"

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.integer  "show_id"
    t.integer  "availability_id"
  end

  add_index "locations", ["availability_id"], :name => "index_locations_on_availability_id"
  add_index "locations", ["show_id"], :name => "index_locations_on_show_id"
  add_index "locations", ["user_id"], :name => "index_locations_on_user_id"

  create_table "payments", :force => true do |t|
    t.integer  "guest_id"
    t.float    "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "payments", ["guest_id"], :name => "index_payments_on_guest_id"

  create_table "shows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ticket_price"
    t.integer  "tickets_min"
    t.integer  "tickets_max"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "tickets_sold", :default => 0
    t.date     "date"
    t.string   "web_string"
    t.time     "time"
    t.boolean  "complete"
    t.boolean  "public"
  end

  add_index "shows", ["web_string"], :name => "index_shows_on_web_string", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                          :default => false
    t.boolean  "musician",                       :default => true
    t.text     "header",          :limit => 255
    t.text     "mp3_1_url",       :limit => 255
    t.text     "mp3_2_url",       :limit => 255
    t.string   "website"
    t.integer  "travel_radius"
    t.boolean  "active"
    t.string   "style"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
