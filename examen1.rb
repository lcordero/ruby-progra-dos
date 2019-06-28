class Animal
    attr_accessor :color, :tamano, :sonido
    def initialize (color, tamano, sonido)
        @color=color
        @tamano=tamano
        @sonido=sonido
    puts "Desconocido!"
    end
    def nuevas_caracteristicas
        puts @color
        puts @tamano
        puts @sonido
      
    end
end

ani1= Animal.new("Negro", "15","miau")
puts ani1.nuevas_caracteristicas

ani1= Animal.new("Blanco", "30","miau")
puts ani1.nuevas_caracteristicas
~
~
~
~

