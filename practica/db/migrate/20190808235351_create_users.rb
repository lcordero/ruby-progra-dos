class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Nombre
      t.integer :Edad

      t.timestamps
    end
  end
end
