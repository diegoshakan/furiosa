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

ActiveRecord::Schema[7.1].define(version: 2024_07_22_072425) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "city", null: false
    t.string "complement"
    t.string "neighborhood", null: false
    t.string "number"
    t.string "reference_point"
    t.string "state", null: false
    t.string "street", null: false
    t.string "zip_code", null: false
    t.uuid "user_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "announcements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "code"
    t.decimal "value", null: false
    t.uuid "user_id", null: false
    t.uuid "category_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_announcements_on_category_id"
    t.index ["deleted_at"], name: "index_announcements_on_deleted_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "content", null: false
    t.uuid "user_id", null: false
    t.uuid "announcement_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_comments_on_announcement_id"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "subcategories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "category_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
    t.index ["deleted_at"], name: "index_subcategories_on_deleted_at"
    t.index ["name"], name: "index_subcategories_on_name", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "nickname"
    t.string "cpf_cnpj", null: false
    t.string "cellphone", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf_cnpj"], name: "index_users_on_cpf_cnpj", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "announcements", "categories"
  add_foreign_key "announcements", "users"
  add_foreign_key "comments", "announcements"
  add_foreign_key "comments", "users"
  add_foreign_key "subcategories", "categories"
end
