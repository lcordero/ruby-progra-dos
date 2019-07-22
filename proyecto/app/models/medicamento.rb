class Medicamento < ApplicationRecord
	belongs_to :pharmacy
	has_many :detalles, dependent: :destroy
	validates_presence_of :dato
end
