class CreateFarmacia < ActiveRecord::Migration[5.2]
  def change
    create_table :farmacia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
