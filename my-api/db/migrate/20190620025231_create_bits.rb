class CreateBits < ActiveRecord::Migration[5.2]
  def change
    create_table :bits do |t|
      t.string :usuario
      t.string :titulo

      t.timestamps
    end
  end
end
