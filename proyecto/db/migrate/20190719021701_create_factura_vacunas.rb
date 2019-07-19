class CreateFacturaVacunas < ActiveRecord::Migration[5.2]
  def change
    create_table :factura_vacunas do |t|
      t.string :Nombre_del_Cliente
      t.string :Apellidos_del_Cliente
      t.integer :Cedula
      t.string :Lugar_de_Residencia
      t.date :Fecha_de_Nacimiento
      t.integer :Total

      t.timestamps
    end
  end
end
