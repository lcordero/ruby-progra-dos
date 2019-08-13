class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nombre
      t.integer :edad 

      t.timestamps
    end
  end
end
