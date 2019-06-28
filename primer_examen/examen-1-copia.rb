class Animal
    attr_accessor :color,:tamano
def Sonido
    puts "Desconocido"
end
end
class Caballo < Animal
    attr_accessor :Raza
def Sonido
    puts "Relincha!"
end
end
a = Animal.new
c = Caballo.new
puts a.Sonido
puts c.Sonido