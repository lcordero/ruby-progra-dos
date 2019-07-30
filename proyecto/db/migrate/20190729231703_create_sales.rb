class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.date :fecha
      t.string :paciente
      t.date :edad

      t.timestamps
    end
  end
end
