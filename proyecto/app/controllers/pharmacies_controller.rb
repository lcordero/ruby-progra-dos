class PharmaciesController < ApplicationController
	before_action :set_pharmacy, only: [:show, :update, :destroy]

# GET /pharmacies
	def index
           		
		@pharmacies = Pharmacy.all
		json_response(@pharmacies)
		
        end

# POST /pharmacies
	def create
		@pharmacy = Pharmacy.create!(pharmacy_params)
		json_response(@pharmacy, :created)
        end

# GET /pharmacies/:id
	def show
		json_response(@pharmacy)
	end

# PUT /pharmacies/:id
	def update
		@pharmacy.update(pharmacy_params)
		head :no_content
        end

# DELETE /pharmacies/:id
	def destroy
		@pharmacy.destroy
	i	head :no_content
        end
	def filter_recipes     #definir el filtro de recetas
		@temp_pharmacy =Pharmacy.find(params[:pharmacy_id])	# buscar atravez de farmacia
		@filter_recipes = params.permit(:nombre)  #aqui lo que se hace es decirle a filter_recipes que busque atravez del nombre(que lo filtre) 
		 @result =[]           # definimos result y decimos que es igual a una lista 
		 for recipe in @temp_pharmacy.recipes do #hacemos un for el cual  reciba @temp_pharmacy y sus parametros
			 
			 @result.push(recipe) if recipe.cliente = params[:nombre]   # le decimos que ejecute el resultado si recipe.cliente es igual al nombre
		 end

	         json_response(@result)    #aplicamos un json_response el  cual procese el resultado
		

	end	
private

	def pharmacy_params
        	# whitelist params
        	params.permit(:nombre)
	end

	def set_pharmacy
        	@pharmacy = Pharmacy.find(params[:id])
	
	end
end
