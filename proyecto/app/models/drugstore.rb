class Drugstore < ApplicationRecord
  has_many :locals, dependent: :destroy
end
