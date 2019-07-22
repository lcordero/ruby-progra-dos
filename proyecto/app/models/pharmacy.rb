class Pharmacy < ApplicationRecord
	has_many :medicos, dependent: :destroy
	validates_presence_of :nombre
end
