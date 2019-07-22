class Inventario < ApplicationRecord
	has_many :productos, dependent: :destroy
end
