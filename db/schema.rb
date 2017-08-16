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

ActiveRecord::Schema.define(version: 20170816041234) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "wage_upper_bound"
    t.integer  "wage_lower_bound"
    t.string   "contact_email"
    t.boolean  "is_hidden",            default: true
    t.string   "source"
    t.string   "place"
    t.string   "scale"
    t.string   "job_experience"
    t.string   "education_background"
    t.string   "skill"
    t.string   "company"
    t.string   "financing_stage"
    t.string   "industry"
    t.string   "job_category"
    t.string   "status",               default: "full_time"
    t.integer  "education_id"
    t.integer  "city_id"
    t.date     "release"
    t.integer  "row_order"
    t.string   "logo"
    t.index ["city_id"], name: "index_jobs_on_city_id"
    t.index ["education_id"], name: "index_jobs_on_education_id"
    t.index ["row_order"], name: "index_jobs_on_row_order"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "legal_name"
    t.string   "username"
    t.date     "birthday"
    t.string   "location"
    t.string   "motto"
    t.string   "wechat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
    t.text     "one_word"
    t.text     "experience"
    t.text     "why"
    t.text     "prove"
    t.text     "action"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.string   "time_zone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
