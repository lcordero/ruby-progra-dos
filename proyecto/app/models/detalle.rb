class Detalle < ApplicationRecord
	belongs_to :medico
        validates_presence_of :especialidad
end
