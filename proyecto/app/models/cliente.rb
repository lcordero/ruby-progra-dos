class Cliente < ApplicationRecord
	 has_many :cliente, dependent: :destroy
	 validates_presence_of :nombre, :edad

end
