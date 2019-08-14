class Sale < ApplicationRecord
	has_many :details, dependent: :destroy
end
