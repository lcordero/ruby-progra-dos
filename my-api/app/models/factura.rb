class Factura < ApplicationRecord
has_many :productos, dependent: :destroy
end

