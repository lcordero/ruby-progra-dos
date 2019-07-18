class Drugstore < ApplicationRecord
  has_many :suppliers, dependent: :destroy
  validates_presence_of :name
end
