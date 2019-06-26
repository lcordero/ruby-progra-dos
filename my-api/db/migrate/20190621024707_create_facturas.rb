class CreateFacturas < ActiveRecord::Migration[5.2]
  def change
    create_table :facturas do |t|
      t.string :titulo
      t.string :creada_por
      t.date :fecha
      t.integer :total

      t.timestamps
    end
  end
end
