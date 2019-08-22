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

ActiveRecord::Schema.define(version: 2019_08_22_180745) do

  create_table "drugs", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "nombre"
    t.string "dosis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_drugs_on_recipe_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "pharmacy_id"
    t.string "cliente"
    t.date "fecha_emicion"
    t.integer "edad"
    t.string "sexo"
    t.string "fecha_de_retiro"
    t.string "cliente_ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacy_id"], name: "index_recipes_on_pharmacy_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.integer "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
