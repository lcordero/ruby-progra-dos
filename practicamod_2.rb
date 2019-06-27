module Moto 
    attr_accessor :color,:marca,:modelo
    def initialize(m_color, m_marca,m_modelo)
        @color = m_color
        @marca = m_marca
        @modelo = m_modelo
        puts "motos" #para destinguir donde es espacio moto
    end
    def sound 
        puts "#{@modelo} did braaaap"
    end 
    def line #defino funcion para acortar codigo
        puts @sound
        puts @marca
        puts @modelo
        puts @color
    end
    class Mot           #clase madre
        include Moto
    end

    class Yamaha<Mot
        attr_accessor :frenos
    end
    class Honda<Mot
        attr_accessor :llantas
    end

    Y = Yamaha.new("BLue","Yamaha","mt03") #creo valores a los atributos
    Y.frenos = "abs" #creo valor unico
    puts Y.line
    puts Y.frenos
    H = Honda.new("Red","Honda","XR400")  #creo valores a los atributo
    H.llantas = "super moto"  #creo valor unico
    puts H.line
    puts H.llantas
end