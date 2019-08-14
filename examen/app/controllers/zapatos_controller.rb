class ZapatosController < ApplicationController
before_action :set_zapato, only:[:show, :destroy, :update, :zapatito]
#GET/index/zapato
def index
  @zapatos=Zapato.all
  json_response(@facturas)
end
#GET/:id/zapato
def show
  json_response(@zapato)
end
#POST/zapato
def create
  @zapato = Zapato.create(zapato_params)
  json_response(@zapato[:created])
end
#DELETE/zapato
def destroy
  @zapato.destroy
  head:no_content
end
#GET/zapatito/:id
def zapatito
  @mensaje=""
  fzapato = @zapato
  if fzapato.nil?
    @mensaje={"mensaje": "Zapatito no existe :'v"}
    json_response(@mensaje)
  else		
    @mensaje = {
	  "mensaje": "Zapatito de tipo " + @zapato[:tipo] + " talla " + @zapato[:tamano].to_s + " hecho de " + @zapato[:material] + " =D "
     }
    json_response(@mensaje)
  end
  @mensaje=""
end
private

def zapato_params
  #parametros permitidos
  params.permit(:tipo, :tamano, :material)
end

def set_zapato
  @zapato = Zapato.find_by(id: params[:id])
end
end

 

