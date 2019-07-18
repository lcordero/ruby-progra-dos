class Recipe < ApplicationRecord
	belongs_to :pharmacy
	has_many :drugs, dependent: :destroy

end
