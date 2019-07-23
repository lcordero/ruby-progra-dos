class Drugstore < ApplicationRecord
  has_many :vaccines, dependent: :destroy
end
