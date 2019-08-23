class CreatePatos < ActiveRecord::Migration[5.2]
  def change
    create_table :patos do |t|
      t.string :nombre
      t.integer :edad
      t.string :color

      t.timestamps
    end
  end
end
