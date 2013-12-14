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

ActiveRecord::Schema.define(version: 20131214003050) do

  create_table "accounts", force: true do |t|
    t.integer  "owner_id"
    t.integer  "max_deals"
    t.integer  "max_contacts"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "site"
    t.text     "adress"
    t.integer  "responsible"
    t.integer  "account_id"
    t.integer  "contact_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "skype"
    t.string   "post"
    t.integer  "responsible"
    t.integer  "account_id"
    t.integer  "company_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "budget"
    t.integer  "responsible"
    t.text     "notes"
    t.integer  "task"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.string   "type_of_task"
    t.text     "description"
    t.datetime "date"
    t.integer  "responsible"
    t.integer  "account_id"
    t.integer  "contact_id"
    t.integer  "company_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "account_id"
    t.integer  "role_id"
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "surname"
    t.string   "mobile_phone"
    t.string   "work_phone"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
