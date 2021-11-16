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

ActiveRecord::Schema.define(version: 2021_11_15_203458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_advices_on_created_by_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "limit_date"
    t.decimal "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "grades", force: :cascade do |t|
    t.decimal "note"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assignment_id"
    t.bigint "user_id"
    t.bigint "subject_id"
    t.boolean "evaluated", default: false
    t.index ["assignment_id"], name: "index_grades_on_assignment_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "owner_subjects", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_owner_subjects_on_owner_id"
    t.index ["subject_id"], name: "index_owner_subjects_on_subject_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "matriname"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "matriname"
    t.string "email"
    t.string "phone_number"
    t.string "enrollment_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "professor_id"
    t.index ["professor_id"], name: "index_subjects_on_professor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["owner_type", "owner_id"], name: "index_users_on_owner_type_and_owner_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "subjects"
  add_foreign_key "grades", "subjects"
  add_foreign_key "grades", "users"
  add_foreign_key "subjects", "professors"
end
