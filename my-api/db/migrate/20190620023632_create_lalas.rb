class CreateLalas < ActiveRecord::Migration[5.2]
  def change
    create_table :lalas do |t|
      t.string :user

      t.timestamps
    end
  end
end
