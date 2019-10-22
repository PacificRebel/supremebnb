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

ActiveRecord::Schema.define(version: 2019_10_22_121740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "space_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.boolean "approved"
    t.bigint "guest_id"
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["space_id"], name: "index_bookings_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.integer "price"
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "host_id"
    t.index ["host_id"], name: "index_spaces_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "bookings", column: "space_id"
  add_foreign_key "bookings", "users", column: "guest_id"
  add_foreign_key "spaces", "users", column: "host_id"
end
