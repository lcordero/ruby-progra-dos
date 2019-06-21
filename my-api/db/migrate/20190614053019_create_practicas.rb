class CreatePracticas < ActiveRecord::Migration[5.2]
  def change
    create_table :practicas do |t|
      t.string :titulo
      t.string :user

      t.timestamps
    end
  end
end
