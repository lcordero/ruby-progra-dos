class Carro 
    attr_accessor :focos, :color, :motor, :modelo
    def initialize (focos, color, motor, modelo)
        @focos = focos
        @color = color
        @motor = motor 
        @modelo = modelo
    puts "inicie edición"
    end 
    def ifsupra
        puts "imprimir resultados"
    end 
    def valores
        puts @focos
        puts @color
        puts @motor
        puts @modelo
    end
end
su = Carro.new("led","blue","Jz 2400","Supra")
 puts su.valores
 puts su.ifsupra