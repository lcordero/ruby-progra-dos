class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Nombre
      t.integer :edad

      t.timestamps
    end
  end
end
