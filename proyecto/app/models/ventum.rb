class Ventum < ApplicationRecord
	has_many :productos, dependent: :destroy
end
