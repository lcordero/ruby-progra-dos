class Drugstore < ApplicationRecord
  has_many :suppliers, dependent: :destroy
end
