class CreateDatilusers < ActiveRecord::Migration[5.2]
  def change
    create_table :datilusers do |t|
      t.references :usuario, foreign_key: true
      t.string :direction
      t.integer :telf
      t.string :sex

      t.timestamps
    end
  end
end
