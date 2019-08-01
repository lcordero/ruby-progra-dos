class Compra < ApplicationRecord
  has_many :compradetalles, dependent: :destroy
end
