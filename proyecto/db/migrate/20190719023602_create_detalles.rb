class CreateDetalles < ActiveRecord::Migration[5.2]
  def change
    create_table :detalles do |t|
      t.string :especialidad

      t.timestamps
    end
  end
end
