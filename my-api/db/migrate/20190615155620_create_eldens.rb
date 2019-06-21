class CreateEldens < ActiveRecord::Migration[5.2]
  def change
    create_table :eldens do |t|
      t.string :user
      t.string :title

      t.timestamps
    end
  end
end
