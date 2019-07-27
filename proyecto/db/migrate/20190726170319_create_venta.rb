class CreateVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :venta do |t|
      t.string :farmacia
      t.string :nombre_paciente
      t.date :fecha

      t.timestamps
    end
  end
end
