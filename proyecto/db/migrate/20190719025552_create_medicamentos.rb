class CreateMedicamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicamentos do |t|
      t.string :dato

      t.timestamps
    end
  end
end
