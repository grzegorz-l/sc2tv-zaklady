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

ActiveRecord::Schema.define(:version => 20110119210450) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "bets", :force => true do |t|
    t.string   "winner"
    t.integer  "gold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duel_id"
    t.integer  "user_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "duels", :force => true do |t|
    t.string   "team1"
    t.string   "team2"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "winner",     :default => ""
    t.boolean  "finished",   :default => false
    t.string   "status",     :default => "Nierozpoczety"
    t.string   "event"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_desc"
  end

  create_table "suggestions", :force => true do |t|
    t.text     "description"
    t.datetime "date"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "team1"
    t.string   "team2"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",  :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",  :null => false
    t.string   "password_salt",                       :default => "",  :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gold",                                :default => 100
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
