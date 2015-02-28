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

ActiveRecord::Schema.define(version: 20150228155701) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "surnames"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.integer "professional_id"
    t.integer "client_id"
    t.integer "rating"
    t.string  "comment"
  end

  create_table "professionals", force: true do |t|
    t.string   "name"
    t.string   "surnames"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "distance"
    t.integer  "average_response_time"
    t.integer  "hourly_price"
    t.decimal  "rating"
  end

  create_table "professionals_specialties", force: true do |t|
    t.string "professional_id"
    t.string "specialty_id"
  end

  add_index "professionals_specialties", ["professional_id"], name: "index_professionals_specialties_on_professional_id"
  add_index "professionals_specialties", ["specialty_id"], name: "index_professionals_specialties_on_specialty_id"

  create_table "specialties", force: true do |t|
    t.string "name"
  end

end
