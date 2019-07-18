class Supplier < ApplicationRecord
  has_many :drugs, dependent: :destroy
  belongs_to :drugstore
  validates_presence_of :name, :agent

end
