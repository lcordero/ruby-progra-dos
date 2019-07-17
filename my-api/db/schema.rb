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

ActiveRecord::Schema.define(version: 2019_07_16_154716) do

  create_table "bets", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bits", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bornes", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bots", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carros", force: :cascade do |t|
    t.integer "factura_id"
    t.string "color"
    t.integer "poder_de_motor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factura_id"], name: "index_carros_on_factura_id"
  end

  create_table "darks", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demos", force: :cascade do |t|
    t.string "titulo"
    t.string "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eldens", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factura_vaccines", force: :cascade do |t|
    t.string "Nombre"
    t.string "Apellidos"
    t.integer "Cedula"
    t.date "FechadeNacimiento"
    t.integer "Total"
    t.string "LugardeResidencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facturas", force: :cascade do |t|
    t.string "titulo"
    t.string "creada_por"
    t.date "fecha"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

  create_table "practicas", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.integer "factura_id"
    t.string "nombre"
    t.integer "cantidad"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factura_id"], name: "index_productos_on_factura_id"
  end

  create_table "pruebas", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rings", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sekiros", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "souls", force: :cascade do |t|
    t.string "usuario"
    t.string "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test2s", force: :cascade do |t|
    t.string "titulo"
    t.string "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vaccines", force: :cascade do |t|
    t.integer "FacturaVaccine_id"
    t.string "Enfermedad"
    t.string "VacunaRecomendada"
    t.integer "Dosis"
    t.integer "TotaldelaVacunasusada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["FacturaVaccine_id"], name: "index_vaccines_on_FacturaVaccine_id"
  end

  create_table "vacunas", force: :cascade do |t|
    t.string "nombre"
    t.string "apellidos"
    t.integer "cedula"
    t.string "lugarderesidencia"
    t.string "enfermedad"
    t.string "vacunarecomendada"
    t.integer "dosisrecomendada"
    t.string "totaldelavacunausada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
