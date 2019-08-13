class TelevisorController < ApplicationController
	before_action :set_televisor, only:  [:show, :update, :destroy]



#GET/#Index/#televisor
	def index
		
		@televisor = Televisor.all
		json_response(@televisor)
	end


#POST/#Create/#televisor
	def create
		@televisor = Televisor.create(televisor_params)
		json_response(@televisor, :created)
	end


#GET/#show/#televisor
	def show
		json_response(@televisor)
	end
			    	
#DELETE/#Destroy/#televisor
	def destroy
		@televisor.destroy
		head :no_content
	end

#GET#custom/custom/:id
	def custom
		alerta = {
		"alerta": "mi channel:" + @televisor[:name , :number]
		}
		json_response(alerta)
	end



private

 	def televisor_params
		params.permit( :name , :number)
	end


	def set_televisor

		@televisor = Televisor.find(params[:id])
	end
end
