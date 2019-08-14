class ZapatosController < ApplicationController
	before_action :set_zapatos, only: [:show,:destroy]
  #GET/Zapatos
	def index
         @zapatos= Zapato.all
         json_response(@zapatos)
     end
  #POST/Zapatos
	def create
         @zapato = Zapato.create!(zapatos_params)
         json_response(@zapato)
     end
  #GET/Zapatos/:id
  def show
	 json_response(@zapato)
  end
  #DELETE/:id
  def destroy
   @zapato.destroy
  head :not_content   
  end
  #GET/zapatito/:id
  def zapatito
   @zapato= Zapato.find(params[:id])
   mensaje={
	     "mensaje":"Zapatito de tipo:,talla: y hecho de :" + @zapato[:tipo] + @zapato[:tamano].to_s + @zapato[:material] 
   } 
  
   json_response(mensaje)
  end
  private
  def zapatos_params
	  params.permit(:tipo, :tamano, :material)
	
  end 
  def set_zapatos
	  @zapato= Zapato.find(params[:id])
  end
end
