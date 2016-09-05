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

ActiveRecord::Schema.define(version: 20160903213828) do

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.boolean  "from_user"
    t.integer  "ping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ping_id"], name: "index_messages_on_ping_id"
  end

  create_table "pings", force: :cascade do |t|
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "version"
    t.string   "ip"
  end

  create_table "pings_programs", id: false, force: :cascade do |t|
    t.integer "ping_id"
    t.integer "program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
