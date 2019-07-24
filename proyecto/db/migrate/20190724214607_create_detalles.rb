class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.references :detalle, foreign_key: true
      t.string :enfermedad
      t.string :sintoma
      t.string :medicacion

      t.timestamps
    end
  end
end
