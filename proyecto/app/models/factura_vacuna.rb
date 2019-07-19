class FacturaVacuna < ApplicationRecord
has_many :vacunas, dependent: :destroy
end
