class Detalle < ApplicationRecord
	 belongs_to :detalle
	 validates_precence_of :enfermedad, :sintoma, :medicacion

end
