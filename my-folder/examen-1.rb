class Animal
    attr_accessor :Color,:Tamano
    def Sonido
        
        puts "Desconocido"

    end
end
    
class Caballo<Animal
    attr_accessor :Raza
    def Sonido
    end
puts Sonido="Relincha"
end
