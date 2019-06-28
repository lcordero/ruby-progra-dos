 
class Animal
    attr_accessor :color, :tamaño 
    def sonido
    end
end
class Toro<Animal
    attr_accessor :Raza
end
sonido = Animal.new
puts sonido."desconocido"
sonido = Toro.new
puts sonido."Muuuu"
