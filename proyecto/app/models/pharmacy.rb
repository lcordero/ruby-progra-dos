class Pharmacy < ApplicationRecord
	has_many :medicamentos, dependent: :destroy
	validates_presence_of :nombre
end
