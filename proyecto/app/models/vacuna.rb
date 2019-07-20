class Vacuna < ApplicationRecord
belongs_to :factura_vacuna
validates_presence_of :Enfermedad, :Vacuna_Recomendada, :Dosis, :Total_de_la_Vacuna_Usada
end
