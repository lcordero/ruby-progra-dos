class PharmaciesController < ApplicationController
	before_action :set_pharmacy, only: [:show, :update, :destroy]

# GET /pharmacies
	def index
		@pharmacies = Pharmacy.all
		json_response(@pharmacys)
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
		head :no_content
        end
	def filter_recipes     #definir el filtro de recetas
		@temp_pharmacy =Pharmacy.find(params[:pharmacy_id])	# buscar atravez de farmacia
		@filter_recipes = params.permit(:nombre)  #aqui lo que se hace es decirle a filter_recipes es 
		 @result =[]
		 for recipe in @temp_pharmacy.recipes do 
			 
                   @result.push(recipe) if recipe.cliente = params[:nombre]
		 end

	         json_response(@result)
		

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
