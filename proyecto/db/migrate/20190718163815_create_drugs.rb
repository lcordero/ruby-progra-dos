class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.references :recipe, foreign_key: true
      t.string :nombre
      t.string :dosis

      t.timestamps
    end
  end
end
