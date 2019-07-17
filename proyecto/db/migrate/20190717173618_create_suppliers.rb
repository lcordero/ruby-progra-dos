class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.references :drugstore, foreign_key: true
      t.string :name
      t.string :agent

      t.timestamps
    end
  end
end
