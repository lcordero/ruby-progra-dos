class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellidos
      t.integer :edad
      t.integer :cedula

      t.timestamps
    end
  end
end
