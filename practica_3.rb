class Carro #creo el objeto carro
    attr_accessor :color,:tipo,:modelo
    def initialize(c_color, c_tipo, c_modelo) #encender auto
        @color = c_color
        @tipo = c_tipo
        @modelo = c_modelo
        puts ("iniciando #{@modelo}")
    end 
    def beep #modelo de pitido
        puts  "#{@modelo} did beep"

    end
    def line
        puts @color
        puts @tipo
        puts @modelo
    end
end
#creo un nuevo objeto
kia = Carro.new("blue", "4x4", "supra")
#consola
puts kia.beep
puts kia.line