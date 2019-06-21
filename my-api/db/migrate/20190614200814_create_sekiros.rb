class CreateSekiros < ActiveRecord::Migration[5.2]
  def change
    create_table :sekiros do |t|
      t.string :user
      t.string :title

      t.timestamps
    end
  end
end
