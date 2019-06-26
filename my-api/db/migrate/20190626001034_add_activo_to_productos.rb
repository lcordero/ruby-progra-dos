class AddActivoToProductos < ActiveRecord::Migration[5.2]
  def change
    add_column :productos, :activo, :boolean
  end
end
