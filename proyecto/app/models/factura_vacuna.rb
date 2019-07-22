class FacturaVacuna < ApplicationRecord
  has_many :Vacuna, dependent: :destroy
  validates_presence_of :Nombre_del_Cliente, :Apellidos_del_Cliente, :Cedula, :Lugar_de_Residencia, :Fecha_de_Nacimiento, :Total
end
