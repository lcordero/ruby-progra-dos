module Notificaciones
def exito
    puts "Yujuu!"
end
def alerta
    puts "Hey hey!!"
end 
def error 
    puts "Damn!"
end
end
class Noti
    include Notificaciones
end
n = Noti.new
puts n.exito
puts n.alerta
puts n.error