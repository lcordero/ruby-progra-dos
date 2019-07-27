class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.references :factura, foreign_key: true
      t.string :Venta
      t.integer :cantidad
      t.string :nombre
      t.integer :precio

      t.timestamps
    end
  end
end
