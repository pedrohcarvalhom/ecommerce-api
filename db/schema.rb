# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_15_015824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.bigint "costumer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["costumer_id"], name: "index_addresses_on_costumer_id"
  end

  create_table "costumers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.string "recover_password_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_costumers_on_email"
    t.index ["token"], name: "index_costumers_on_token"
  end

  add_foreign_key "addresses", "costumers"
end
