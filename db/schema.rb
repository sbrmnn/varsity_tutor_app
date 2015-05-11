# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150510215405) do

  create_table "products", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "photo_url",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products", ["name"], name: "index_products_on_name"

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "product_id",      null: false
    t.string   "purchasers_name", null: false
    t.string   "address",         null: false
    t.string   "city",            null: false
    t.string   "state",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "purchase_orders", ["address", "city", "state"], name: "index_purchase_orders_on_address_and_city_and_state"
  add_index "purchase_orders", ["product_id"], name: "index_purchase_orders_on_product_id"
  add_index "purchase_orders", ["purchasers_name"], name: "index_purchase_orders_on_purchasers_name"

end
