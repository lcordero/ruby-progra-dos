class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.references :pharmacy, foreign_key:true 
      t.string :nombre

      t.timestamps
    end
  end
end
