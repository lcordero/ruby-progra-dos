class CreateIllnesses < ActiveRecord::Migration[5.2]
  def change
    create_table :illnesses do |t|
      t.references :vaccine, foreign_key: true
      t.string :enfermedad
      t.string :dosis

      t.timestamps
    end
  end
end
