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

ActiveRecord::Schema[7.0].define(version: 2022_05_29_204050) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "time_delivery"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_delivery_times_on_shipping_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "volume"
    t.integer "weight"
    t.integer "distance"
    t.string "from_address"
    t.string "from_city"
    t.string "from_state"
    t.string "to_address"
    t.string "to_city"
    t.string "to_state"
    t.string "code"
    t.integer "estimated_delivery_time"
    t.integer "value"
    t.string "recipient_name"
    t.integer "vehicle_id"
    t.integer "shipping_company_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_orders_on_shipping_company_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "price_settings", force: :cascade do |t|
    t.integer "min_volume"
    t.integer "max_volume"
    t.integer "min_weight"
    t.integer "max_weight"
    t.integer "distance_value"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_price_settings_on_shipping_company_id"
  end

  create_table "search_budgets", force: :cascade do |t|
    t.decimal "height"
    t.decimal "width"
    t.decimal "depth"
    t.integer "weight"
    t.integer "volume"
    t.integer "distance"
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_search_budgets_on_admin_id"
  end

  create_table "shipping_companies", force: :cascade do |t|
    t.string "corporate_name"
    t.string "brand_name"
    t.integer "registration_number"
    t.string "email_domain"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipping_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shipping_company_id"], name: "index_users_on_shipping_company_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.integer "fabrication_year"
    t.integer "capacity"
    t.integer "shipping_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_company_id"], name: "index_vehicles_on_shipping_company_id"
  end

  add_foreign_key "delivery_times", "shipping_companies"
  add_foreign_key "orders", "shipping_companies"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "price_settings", "shipping_companies"
  add_foreign_key "search_budgets", "admins"
  add_foreign_key "users", "shipping_companies"
  add_foreign_key "vehicles", "shipping_companies"
end
