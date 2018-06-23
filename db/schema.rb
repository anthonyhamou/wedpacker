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

ActiveRecord::Schema.define(version: 2018_06_06_092026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "country"
    t.string "region"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.date "starts_on"
    t.date "ends_on"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_availabilities_on_supplier_id"
  end

  create_table "bundle_lines", force: :cascade do |t|
    t.bigint "supplier_id"
    t.bigint "bundle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["bundle_id"], name: "index_bundle_lines_on_bundle_id"
    t.index ["supplier_id"], name: "index_bundle_lines_on_supplier_id"
  end

  create_table "bundles", force: :cascade do |t|
    t.string "state", default: "pending"
    t.date "starts_on"
    t.date "ends_on"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.json "payment"
    t.integer "capacity"
    t.index ["user_id"], name: "index_bundles_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "photo"
    t.bigint "supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_images_on_supplier_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "supplier_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_reviews_on_supplier_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "owner"
    t.text "description"
    t.float "avg_rating"
    t.string "originality"
    t.string "email"
    t.integer "capacity"
    t.string "address"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "price_cents", default: 0, null: false
    t.string "service_name"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_suppliers_on_area_id"
    t.index ["service_id"], name: "index_suppliers_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "suppliers"
  add_foreign_key "bundle_lines", "bundles"
  add_foreign_key "bundle_lines", "suppliers"
  add_foreign_key "bundles", "users"
  add_foreign_key "images", "suppliers"
  add_foreign_key "reviews", "suppliers"
  add_foreign_key "reviews", "users"
  add_foreign_key "suppliers", "areas"
  add_foreign_key "suppliers", "services"
end
