class ZapatosController < ApplicationController
	before_action :set_zapato, only:[:show , :destroy]
        before_action :set_zapato_zapatito, only:[:zapatito]

#GET#index/zapatos
	def index
		@zapato = Zapato.all 
		json_response(@Zapatos)
	end

#POST#create/zapatos
	def create
		@zapato = Zapato.create!(zapato_params)
		json_response(@zapato, :created )
	end

#GET#show/zapatos/:id 
	def show
		json_response(@zapato)
	end

#DELETE#destroy/zapatos/:id
	def destroy 
		@zapato.destroy
		head :no_content
	end

#GET/zapatito/:id
	def zapatito
		
		mensaje = {
		temp_zapato= zapatito.find_by!(params[:id])
			if temp_zapato.nil?
			   mensaje = "zapatito existe"
                           json_response(mensaje)

			else
			   temp_zapato.nil?
			   mensaje = " Zapatito no existe ='("
                           json_response(mensaje)
					
				end
		}
	end        
	


private

	def zapato_params
		params.permit( :tipo, :tamano, :material)
	end

	def set_zapato
		 @zapato = Zapato.find(params[:id])
	 
	end


	 def set_zapato_zapatito
		@zapatito = Zapato.zapatito.find_by!(params[:id])
	 #end
end
