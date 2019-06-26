class Factura
    attr_accessor :nombre,:fecha
    def initialize(f_nombre, f_fecha)
        @nombre = f_nombre 
        @fecha = f_fecha
        puts "su factura"
    end
    def im_factura
        puts "#{@nombre} se ha imprimido la factura"
    end 
    def line
        puts @fecha
        puts @nombre
    end

end

f = Factura.new("anthony","20/12/19")
puts f.line
puts f.im_factura