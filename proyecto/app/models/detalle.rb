class Detalle < ApplicationRecord
	 belongs_to :detalle
	 validates_presence_of :enfermedad, :sintoma, :medicacion

end
