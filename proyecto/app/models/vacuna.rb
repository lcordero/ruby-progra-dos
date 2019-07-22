class Vacuna < ApplicationRecord
  belongs_to :facturavacuna
  validates_presence_of :Enfermedad, :Vacuna_Recomendada, :Dosis, :Total_de_la_Vacuna_Usada
end
