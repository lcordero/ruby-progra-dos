class CreatePracticas < ActiveRecord::Migration[5.2]
  def change
    create_table :practicas do |t|
      t.string :user
      t.string :title

      t.timestamps
    end
  end
end
