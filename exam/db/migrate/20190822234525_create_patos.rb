class CreatePatos < ActiveRecord::Migration[5.2]
  def change
    create_table :patos do |t|
      t.string :nombre
      t.intenger :edad
      t.string :color

      t.timestamps
    end
  end
end
