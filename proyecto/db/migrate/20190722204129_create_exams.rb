class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :exam, foreign_key: true
      t.string :tipo
      t.string :muestra
      t.integer :costo
      t.string :indicacion
      t.integer :tiempo
      t.string :resultado

      t.timestamps
    end
  end
end
