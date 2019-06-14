class CreateTes < ActiveRecord::Migration[5.2]
  def change
    create_table :tes do |t|
      t.string :name
      t.string :lastname

      t.timestamps
    end
  end
end
