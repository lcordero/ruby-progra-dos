class CreateVaccines < ActiveRecord::Migration[5.2]
  def change
    create_table :vaccines do |t|
      t.references :drugstore, foreign_key: true
      t.string :dosis

      t.timestamps
    end
  end
end
