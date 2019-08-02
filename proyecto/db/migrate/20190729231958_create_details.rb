class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :factura, foreign_key: true
      t.integer :cantidad
      t.string :nombre
      t.integer :precio
      

      t.timestamps
    end
  end
end
