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

ActiveRecord::Schema.define(version: 20140531204048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "polling_locations", force: true do |t|
    t.integer  "api_id",                 null: false
    t.string   "name",                   null: false
    t.string   "address",                null: false
    t.integer  "zip",                    null: false
    t.time     "opens_at",               null: false
    t.time     "closes_at",              null: false
    t.date     "early_voting_starts"
    t.time     "early_voting_opens_at"
    t.time     "early_voting_closes_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "address"
    t.integer  "zip"
    t.date     "birthday",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
