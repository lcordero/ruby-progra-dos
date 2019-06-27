class Animal
	attr_accessor :color, :tamano 

	def Sonido
		puts "Desconocido!"
	end
end

class Gato<Animal
	attr_accessor :raza

	def Sonido
		puts "Miau"
	end
end


