class Detalle < ApplicationRecord
	belongs_to :medicamento
	validates_presence_of :informacion
        validates_presence_of :presentacion
        validates_presence_of :dosis
        validates_presence_of :efecto
        validates_presence_of :compania
        validates_presence_of :caducidad

end
