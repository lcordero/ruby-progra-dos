  class Animal
    attr_accessor :color, :tamaño
    def initialize (color, tamaño)
        @color=color
        @tamaño=tamaño
    end
        def sonido
        puts "Desconocido!"
        end
        
        def Perro > Animal #aqui intente hacer la herencia correspondiente pero va imposible!!
            attr_accessor :raza :sonido
            def initialize (raza, sonido)
                @raza=raza
                @sonido=sonido
            
                def sonido2
                    print "guau"
                end

            end
        end 
end
nv=Animal.new("blanco", "1 metro")
puts nv.sonido
nv=Perro.new("doberman", "guau")
puts nv.sonido2
