class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.string :nombredrug

      t.timestamps
    end
  end
end
