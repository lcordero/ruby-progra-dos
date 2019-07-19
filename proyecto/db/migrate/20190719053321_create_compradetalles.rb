class CreateCompradetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :compradetalles do |t|
      t.string :nomprovee
      t.date :fecha
      t.integer :cantidad
      t.float :costo
      t.string :presentacion

      t.timestamps
    end
  end
end
