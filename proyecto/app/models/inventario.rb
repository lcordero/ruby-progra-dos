class Inventario < ApplicationRecord
	has_many :productos, dependent: :destroy
	validates :sistema, :via, length: { maximum: 15 }
	validates :sistema, :via, :fecha_ingreso, presence: { message: "Datos necesarios" } 
end
	#validates :fecha_ingreso > Date.today {message: "la fecha no puede ser en el pasdo"}
	#def fecha_ingreso
    #if fecha_ingreso.present? && fecha_ingreso < Date.today
     # errors.add(:fecha_ingreso, "No puede ser en el pasado")
    #end
  #end
  #end
