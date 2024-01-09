# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_08_213801) do
  create_table "admonition_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admonitions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status_admonition"
    t.date "date"
    t.string "responsable_id"
    t.bigint "user_id"
    t.bigint "admonition_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admonition_types_id"], name: "index_admonitions_on_admonition_types_id"
    t.index ["user_id"], name: "index_admonitions_on_user_id"
  end

  create_table "announcements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "content"
    t.text "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "status_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_type_id"], name: "index_attendances_on_status_type_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "calendar_events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date"
    t.binary "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents_storages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "url"
    t.bigint "documents_type_id", null: false
    t.bigint "justification_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admonitions_id", null: false
    t.index ["admonitions_id"], name: "index_documents_storages_on_admonitions_id"
    t.index ["documents_type_id"], name: "index_documents_storages_on_documents_type_id"
    t.index ["justification_id"], name: "index_documents_storages_on_justification_id"
  end

  create_table "documents_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internal_communications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_internal_communications_on_user_id"
  end

  create_table "justification_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "justifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "status_justification"
    t.date "date"
    t.string "responsable_id"
    t.bigint "user_id"
    t.bigint "justification_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["justification_types_id"], name: "index_justifications_on_justification_types_id"
    t.index ["user_id"], name: "index_justifications_on_user_id"
  end

  create_table "jwt_denylist", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "status_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "identification", default: "", null: false
    t.string "username", default: "", null: false
    t.string "number", default: "", null: false
    t.string "email", default: "", null: false
    t.date "borndate", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_user_id", null: false
    t.string "jti", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type_user_id"], name: "index_users_on_type_user_id"
  end

  add_foreign_key "admonitions", "admonition_types", column: "admonition_types_id"
  add_foreign_key "admonitions", "users"
  add_foreign_key "attendances", "status_types"
  add_foreign_key "attendances", "users"
  add_foreign_key "documents_storages", "admonitions", column: "admonitions_id"
  add_foreign_key "documents_storages", "documents_types"
  add_foreign_key "documents_storages", "justifications"
  add_foreign_key "internal_communications", "users"
  add_foreign_key "justifications", "justification_types", column: "justification_types_id"
  add_foreign_key "justifications", "users"
  add_foreign_key "users", "type_users"
end
