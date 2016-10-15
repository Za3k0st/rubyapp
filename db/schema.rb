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

ActiveRecord::Schema.define(version: 20161015050802) do

  create_table "countries", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "email",              limit: 255
    t.string   "firstname",          limit: 255
    t.string   "lastname",           limit: 255
    t.string   "right",              limit: 255
    t.string   "status",             limit: 255
    t.string   "encrypted_password", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image",              limit: 255
    t.string   "password",           limit: 255
    t.string   "role",               limit: 255
    t.string   "country",            limit: 255
    t.string   "personal_email",     limit: 255
    t.string   "educare_email",      limit: 255
    t.string   "joining_date",       limit: 255
    t.string   "ending_date",        limit: 255
    t.string   "birthday",           limit: 255
    t.string   "jobrole",            limit: 255
    t.string   "phone",              limit: 255
  end

end
