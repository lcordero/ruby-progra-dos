class CreateFacturas < ActiveRecord::Migration[5.2]
  def change
    create_table :facturas do |t|
      t.string :farmacia
      t.string :nombre_paciente
      t.date :fecha

      t.timestamps
    end
  end
end
