class AddActivoToDrugs < ActiveRecord::Migration[5.2]
  def change
    add_column :drugs, :activo, :boolean
  end
end
