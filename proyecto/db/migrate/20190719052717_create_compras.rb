class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.references :drugstore, foreign_key: true
      t.string :nombredrug

      t.timestamps
    end
  end
end
