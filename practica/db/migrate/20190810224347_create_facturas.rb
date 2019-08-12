class CreateFacturas < ActiveRecord::Migration[5.2]
  def change
    create_table :facturas do |t|
      t.string :nombre_del_cliente
      t.string :apellidos_del_cliente
      t.integer :cedula

      t.timestamps
    end
  end
end
