class Sale < ApplicationRecord
  has_many :productos, dependent: :destroy

end
