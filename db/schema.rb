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

ActiveRecord::Schema.define(:version => 20111214022220) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "budget_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budgets", :force => true do |t|
    t.datetime "year"
    t.string   "filename"
    t.integer  "category_id"
    t.integer  "budget_types_id"
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "expenditure"
    t.integer "revenue"
    t.string  "ancestry"
    t.string  "budget_id"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "feedback_items", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feedback_id"
    t.integer  "position"
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
