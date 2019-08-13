class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :nombre
      t.integer :modelo

      t.timestamps
    end
  end
end
