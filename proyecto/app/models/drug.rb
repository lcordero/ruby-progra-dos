class Drug < ApplicationRecord
  belongs_to :supplier
  validates_presence_of :name
end
