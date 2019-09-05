ActiveRecord::Schema.define(version: 2019_08_12_153800) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
~

