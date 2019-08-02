class Sale < ApplicationRecord
  has_many :detail, dependent: :destroy
end
