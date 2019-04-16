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

ActiveRecord::Schema.define(version: 2019_04_16_183427) do

  create_table "campaigns", force: :cascade do |t|
    t.boolean "completed"
    t.string "title"
    t.integer "expect_number_of_meetups"
    t.integer "difficulty"
    t.integer "max_number_of_characters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.integer "campaign_id"
    t.string "alignment"
    t.string "char_name"
    t.string "race"
    t.string "weapon"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "klass"
  end

  create_table "meetups", force: :cascade do |t|
    t.integer "campaign_id"
    t.string "location"
    t.datetime "meet_time"
    t.integer "number_of_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_meetups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "email_address"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
