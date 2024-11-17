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

ActiveRecord::Schema[8.0].define(version: 2024_11_10_130048) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "state"
    t.string "city"
    t.string "neighborhood"
    t.string "street"
    t.string "number"
    t.string "zipcode"
    t.string "reference_point"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "code"
    t.decimal "value"
    t.integer "user_id", null: false
    t.integer "category_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_announcements_on_category_id"
    t.index ["deleted_at"], name: "index_announcements_on_deleted_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "title"
    t.integer "category_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
    t.index ["deleted_at"], name: "index_subcategories_on_deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "announcements", "categories"
  add_foreign_key "announcements", "users"
  add_foreign_key "subcategories", "categories"
end
