class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.references :medicamento, foreign_key: true
      t.string :informacion
      t.string :presentacion
      t.string :dosis
      t.string :efecto
      t.string :compania
      t.string :caducidad
      t.timestamps
    end
  end
end
