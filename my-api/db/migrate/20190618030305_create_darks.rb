class CreateDarks < ActiveRecord::Migration[5.2]
  def change
    create_table :darks do |t|
      t.string :usuario
      t.string :titulo

      t.timestamps
    end
  end
end
