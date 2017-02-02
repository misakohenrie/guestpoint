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

ActiveRecord::Schema.define(version: 20170113041522) do

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "pin"
    t.string   "ssn"
    t.date     "birthdate"
    t.date     "hire_date"
    t.date     "termination_date"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "picture",          default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.integer  "unit_id"
    t.string   "email"
  end

  create_table "job_types", force: :cascade do |t|
    t.string   "description"
    t.boolean  "tipped"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.integer  "unit_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "employee_id"
    t.integer  "job_type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_jobs_on_employee_id"
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

end
