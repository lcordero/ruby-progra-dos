class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.string :especialidad
      t.references :medico, foreign_key: true

      t.timestamps
    end
  end
end
