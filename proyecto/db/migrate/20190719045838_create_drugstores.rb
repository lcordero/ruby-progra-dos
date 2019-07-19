class CreateDrugstores < ActiveRecord::Migration[5.2]
  def change
    create_table :drugstores do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
