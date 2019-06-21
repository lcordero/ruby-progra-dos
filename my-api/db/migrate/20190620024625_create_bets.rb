class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.string :usuario
      t.string :titulo

      t.timestamps
    end
  end
end
