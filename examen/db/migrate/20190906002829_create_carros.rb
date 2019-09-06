class CreateCarros < ActiveRecord::Migration[5.2]
  def change
    create_table :carros do |t|  
      t.references :carro, foreign_key: true
      t.string :marca
      t.intenger :puertas
      t.string :color

      t.timestamps
    end
  end
end
