class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.references :medico, foreign_key: true   
      t.string :especialidad

      t.timestamps
    end
  end
end
