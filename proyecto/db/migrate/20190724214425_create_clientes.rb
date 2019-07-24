class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.references :cliente, foreign_key: true
      t.string :nombre
      t.integer :edad

      t.timestamps
    end
  end
end
