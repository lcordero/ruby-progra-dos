class ZapatosController < ApplicationController
	#index
	def index
		@zapatos=Zapato.all
		json_response(@zapatos)
	end
	#create
	def create
		@zapato=Zapato.create!(zapato_params)
		json_response(@zapato)
	end
	#show/zapato/:id
	def show
		@zapatos=Zapatos.find(params[:id])
		json_response(@zapatos)
	end
	#destroy
	def destroy
		@zapato=Zapato.find(params[:id])
                @zapato.destroy
		head :no_content
	end
	#zapatito
	def zapatito
		@zapato=Zapato.find(params[:id])
		mensaje={
			"mensaje":"zapatito tipo" + @zapato[:tipo]}
		
	end
	def zapatito2
		@zapato=Zapato.find(params[:id])
		mensaje={
			"mensaje": "zapatito no existe"}
	end
	#params
	def zapato_params
		params.permit(:tipo, :tamaño, :material)
	end
end
