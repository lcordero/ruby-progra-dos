class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
	t.references :factura, foreign_key: true
      t.string :nombre
      t.integer :cantidad
      t.integer :precio

      t.timestamps
    end
  end
end
