class CreateKakusus < ActiveRecord::Migration[5.2]
  def change
    create_table :kakusus do |t|
      t.string :user

      t.timestamps
    end
  end
end
