class ZapatosController < ApplicationController
	before_action :set_zapa, only: [:show, :destroy, :zapatito]
	
	#GET /zapatos
	def index 
 	  @zapatos= Zapato.all
	  json_response(@zapatos)
	end

	#Post /zapatos
	def create 
	  @zapato= Zapato.create!(zapa_params)
	  json_response(@zapato)
	end

	#GET /zapatos/:id
	def show
          json_response(@zapato)
	end

	#DELETE /zapatos/:id
	def destroy
	  @zapato.destroy
	  json_response("los zapatos han sido eliminados")
	end
        
	#GET zapatito
	def zapatito
	  if 
	  @zapato = Zapato.find_by!(params[:id])	
       	  msg ={
		  "mensaje": + "zapatito de tipo "+ @zapato[:tipo] + ", talla " + @zapato[:tamano].to_s + " y echo de " + @zapato[:material]} 
	  if not 
	  msg = {
		 "mensaje": + "zapatito no existe ='("
	  }
	  end    
	end
	  json_response(msg)
	end
	private
	def zapa_params
	  params.permit(:tipo, :tamano, :material)
	end
	def set_zapa
	  @zapato = Zapato.find_by(id:params[:id])
	end

end
