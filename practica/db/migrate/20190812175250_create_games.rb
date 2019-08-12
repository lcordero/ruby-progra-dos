class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :nombre
      t.string :tipo
      t.integer :tiempo

      t.timestamps
    end
  end
end
