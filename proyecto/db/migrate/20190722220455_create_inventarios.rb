class CreateInventarios < ActiveRecord::Migration[5.2]
  def change
    create_table :inventarios do |t|
      t.string :sistema
      t.string :via
      t.date :fecha_ingreso

      t.timestamps
    end
  end
end
