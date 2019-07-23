class Drugstore < ApplicationRecord
	has_many :compras, dependent: :destroy
end
