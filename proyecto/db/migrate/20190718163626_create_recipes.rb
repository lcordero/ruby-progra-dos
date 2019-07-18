class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|


      t.references :pharmacy, foreign_key: true
      t.string :cliente
      t.date :fecha_emicion
      t.integer :edad
      t.string :sexo
      t.string :fecha_de_retiro
      t.string :cliente_ID

      t.timestamps
    end
  end
end
