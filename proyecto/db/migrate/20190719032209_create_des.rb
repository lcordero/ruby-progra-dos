class CreateDes < ActiveRecord::Migration[5.2]
  def change
    create_table :des do |t|
      t.string :Venta
      t.string :paciente
      t.date :fecha

      t.timestamps
    end
  end
end
