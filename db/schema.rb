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

ActiveRecord::Schema.define(version: 20141222042921) do

  create_table "image_master_table", primary_key: "image_id", force: true do |t|
    t.string    "path",                                         null: false
    t.float     "latitude",          limit: 53,                 null: false
    t.float     "longitude",         limit: 53,                 null: false
    t.float     "height",            limit: 53,                 null: false
    t.float     "row",               limit: 53,                 null: false
    t.float     "pitch",             limit: 53,                 null: false
    t.float     "yaw",               limit: 53,                 null: false
    t.integer   "image_size_height",                            null: false
    t.integer   "image_size_width",                             null: false
    t.timestamp "created_date"
    t.boolean   "converted",                    default: false
  end

  create_table "image_processed_tables", force: true do |t|
    t.string   "path"
    t.integer  "x"
    t.integer  "y"
    t.integer  "z"
    t.datetime "create_date"
    t.datetime "taken_date"
    t.integer  "theta"
    t.integer  "height"
    t.integer  "width"
    t.integer  "source_image_ids"
  end

end
