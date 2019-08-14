class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :pharmacy
      t.date :fecha
      t.string :paciente
      t.integer :edad

      t.timestamps
    end
  end
end
