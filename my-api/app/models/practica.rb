class Practica < ApplicationRecord
	validates_presence_of :titulo
	validates_presence_of :user
end
