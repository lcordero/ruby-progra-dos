class CreateSekiros < ActiveRecord::Migration[5.2]
  def change
    create_table :sekiros do |t|
      t.string :usuarios
      t.string :concha

      t.timestamps
    end
  end
end
