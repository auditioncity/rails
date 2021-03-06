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

ActiveRecord::Schema.define(version: 20151214165109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.text     "bio"
    t.integer  "age_young"
    t.integer  "age_old"
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.string   "hair_color"
    t.string   "eye_color"
    t.string   "skills"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "talent_agency"
    t.string   "union"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "headshot_file_name"
    t.string   "headshot_content_type"
    t.integer  "headshot_file_size"
    t.datetime "headshot_updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "primary_address"
    t.string   "primary_email"
    t.string   "primary_phone"
    t.string   "primary_url"
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "label"
  end

  create_table "contact_informations", force: :cascade do |t|
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.string   "type"
    t.string   "label"
    t.string   "info"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "decisions", force: :cascade do |t|
    t.integer  "actor_id",                    null: false
    t.integer  "director_id",                 null: false
    t.text     "notes"
    t.boolean  "callback",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "directors", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.string   "company_name"
    t.string   "primary_address"
    t.string   "primary_email"
    t.string   "primary_phone"
    t.string   "primary_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
