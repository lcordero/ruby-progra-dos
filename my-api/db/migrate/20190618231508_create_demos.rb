class CreateDemos < ActiveRecord::Migration[5.2]
  def change
    create_table :demos do |t|
      t.string :usuario
      t.string :titulo

      t.timestamps
    end
  end
end
