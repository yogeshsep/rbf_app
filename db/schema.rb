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

ActiveRecord::Schema.define(:version => 20140321064550) do

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "sex"
    t.text     "addr"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode"
    t.text     "pan"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "code"
    t.string   "image"
  end

  create_table "folios", :force => true do |t|
    t.date     "folio_allocation_date"
    t.integer  "folio_number"
    t.integer  "no_of_shares"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "customer_id"
  end

  create_table "savingsdeposits", :force => true do |t|
    t.integer  "current_balance", :limit => 255
    t.date     "opened_on"
    t.string   "account_type"
    t.string   "status"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "customer_id"
  end

  create_table "savingsdeposittransactions", :force => true do |t|
    t.date     "transaction_date"
    t.string   "status"
    t.integer  "transaction_amount", :limit => 255
    t.string   "transaction_mode"
    t.string   "transaction_type"
    t.string   "particulars"
    t.string   "comments"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "savingsdeposit_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "Role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
