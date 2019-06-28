  module Notificaciones
    attr_accessor :exito, :alerta, :error 
    def initialize (exito, alerta, error)
        @exito=exito
        @alerta=alerta
        @error=error
    puts "preparando"
    end 
    def cuidado
        puts "este es su estado"
    end
    def nuevos_valores
        puts @exito
        puts @alerta
        puts @error
        puts "este es su estado"
    end
end
ll1=Notificaciones.new("yeah!", "hey hey!", "sorry!")
puts ll1.cuidado
puts ll1.nuevos_valores
