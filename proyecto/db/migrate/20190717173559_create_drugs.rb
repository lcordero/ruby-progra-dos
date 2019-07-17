class CreateDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :drugs do |t|
      t.references :supplier, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
