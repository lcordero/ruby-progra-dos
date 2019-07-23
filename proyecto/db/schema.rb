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

ActiveRecord::Schema.define(version: 2019_07_23_020709) do

  create_table "detalles", force: :cascade do |t|
    t.integer "medico_id"
    t.string "especialidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_detalles_on_medico_id"
  end

  create_table "medicos", force: :cascade do |t|
    t.integer "pharmacy_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacy_id"], name: "index_medicos_on_pharmacy_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "nombre"
    t.integer "pharmacies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pharmacies_id"], name: "index_pharmacies_on_pharmacies_id"
  end

end
