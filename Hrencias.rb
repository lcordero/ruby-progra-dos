module Herencia

    attr_accessor :nombres, :apellidos, :monto, :vuelto
    def initialize(nombres,apellidos,monto,vuelto)
        @nombres = nombres
        @apellidos = apellidos
        @monto = monto
        @vuelto = vuelto
    puts "Inicio Factura"
    end
    def infomacion
        puts @nombres
        puts @apellidos
        puts @monto
        puts @vuelto
    end 

    class Fac
        include Herencia
    end
    class Precio<Fac
    attr_accessor :valor
    end
        
    f = Precio.new("Gabriel","Mena","1000","500")
    puts f.infomacion
 end 