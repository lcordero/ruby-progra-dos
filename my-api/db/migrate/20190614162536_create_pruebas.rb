class CreatePruebas < ActiveRecord::Migration[5.2]
  def change
    create_table :pruebas do |t|
      t.string :user
      t.string :title

      t.timestamps
    end
  end
end
