class CreateMedicamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicamentos do |t|
      t.references :pharmacy, foreign_key: true
      t.string :dato

      t.timestamps
    end
  end
end
