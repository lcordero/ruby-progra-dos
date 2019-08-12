class CreateGokus < ActiveRecord::Migration[5.2]
  def change
    create_table :gokus do |t|
      t.string :hijo
      t.string :fase

      t.timestamps
    end
  end
end
