class CreateAutos < ActiveRecord::Migration[5.2]
  def change
    create_table :autos do |t|
      t.string :nombre
      t.integer :modelo

      t.timestamps
    end
  end
end
