class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :created_by

      t.timestamps null: false
    end
  end
end
