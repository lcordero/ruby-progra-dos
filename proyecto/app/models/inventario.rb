class Inventario < ApplicationRecord
	has_many :productos, dependent: :destroy
	validates :sistema, :via, length: { maximum: 15 }
	validates :sistema, :via, :fecha_ingreso, presence: { message: "Datos necesarios" } 
	#validates :fecha_ingreso,
end
