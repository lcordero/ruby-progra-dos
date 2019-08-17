class CreateZapatos < ActiveRecord::Migration[5.2]
  def change
    create_table :zapatos do |t|
      t.string :tipo
      t.integer :tamano
      t.string :material

      t.timestamps
    end
  end
end