class Drugstore < ApplicationRecord
	has_many :compras, dependent: :destroy
	validates_presence_of :nombre
end
