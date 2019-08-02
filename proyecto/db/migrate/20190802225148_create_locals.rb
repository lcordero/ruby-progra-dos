class CreateLocals < ActiveRecord::Migration[5.2]
  def change
    create_table :locals do |t|
      t.references :drugstore, foreign_key: true
      t.string :provincia
      t.string :canton
      t.string :contacto

      t.timestamps
    end
  end
end
