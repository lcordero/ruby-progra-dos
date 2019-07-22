class CreateVacunas < ActiveRecord::Migration[5.2]
  def change
    create_table :Vacuna do |t|
      t.references :FacturaVacuna, foreign_key: true
      t.string :Enfermedad
      t.string :Vacuna_Recomendada
      t.integer :Dosis
      t.integer :Total_de_la_Vacuna_Usada

      t.timestamps
    end
  end
end
