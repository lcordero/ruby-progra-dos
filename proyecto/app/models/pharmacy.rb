class Pharmacy < ApplicationRecord
	has_many :recipes, dependent: :destroy
end
