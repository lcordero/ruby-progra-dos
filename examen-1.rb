class Animal
    attr_accessor :color,:tamano
    def Sonido
        puts "Desconocido"
    end
end
a = Animal.new
puts a.Sonido