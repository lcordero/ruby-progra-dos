require_relative "practicamod_2.rb"
module Carro
    attr_accessor :color,:marca,:modelo,:tipo
    def initialize (c_color,c_marca, c_modelo, c_tipo)
        @color = c_color
        @marca = c_marca
        @modelo = c_modelo
        @tipo = c_tipo
        puts "carros"
    end
    def sound 
        puts "#{@modelo} did brumm"
    end
    def line #creo funcion para acortar codigo
        puts @sound
        puts @marca
        puts @modelo
        puts @tipo
        puts @color
    end
    class Car #clase madre
        include Carro
    end
    class Kia < Car
        attr_accessor :halogenos
    end
    class Toyota < Car
        attr_accessor :pantalla
    end

k = Kia.new("red","Kia","sorento","sport")
k.halogenos = "leds"
puts k.line
puts k.halogenos
t = Toyota.new("purple","toyota","tacoma","sport")
t.pantalla = "radio tactil"
puts t.line
puts t.pantalla
end