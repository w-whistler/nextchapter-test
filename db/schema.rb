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

ActiveRecord::Schema[7.1].define(version: 2024_07_31_020732) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_items", force: :cascade do |t|
    t.string "description", null: false
    t.integer "quantity", null: false
    t.decimal "amount", null: false
    t.bigint "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "invoice_number", null: false
    t.string "client_name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "payment_schedules", force: :cascade do |t|
    t.string "payment_frequency", null: false
    t.decimal "payment_amount", null: false
    t.date "start_date", null: false
    t.bigint "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payment_schedules_on_invoice_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "payment_date", null: false
    t.decimal "amount", null: false
    t.bigint "payment_schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_schedule_id"], name: "index_payments_on_payment_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoices", "users"
  add_foreign_key "payment_schedules", "invoices"
  add_foreign_key "payments", "payment_schedules"
end
