class Producto < ApplicationRecord
    belongs_to :inventario
    validates :nombre, length: { maximum: 15 }
    validates :nombre, :cantidad, :fecha_vencimiento, presence: { message: "Datos necesarios" }
end
