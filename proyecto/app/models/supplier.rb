class Supplier < ApplicationRecord
  has_many :drugs, dependent: :destroy
  belongs_to :drugstore

end
