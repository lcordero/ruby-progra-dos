class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.references :inventario, foreign_key: true
      t.string :nombre
      t.integer :cantidad
      t.date :fecha_vencimiento

      t.timestamps
    end
  end
end
