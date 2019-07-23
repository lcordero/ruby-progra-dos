class Vaccine < ApplicationRecord
  has_many :illnesses, dependent: :destroy
  belongs_to :drugstore
end
