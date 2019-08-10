class TelevisorController < ApplicationController
	before_action :set_televisor, only: [:show, :update, :destroy]


#GET#televisor
        def index
                @televisor = Televisor.all
                json_response(@televisor)
        end
#GET#:id
	def show
		json_response(@televisor)
	end
	
#POST#create
        def create
		@televisor = Televisor.create! (televisor_params)
        json_response(@televisor, :created)
	end

#PUT#id
	def update
		@televisor.update(televisor_params)
		head :no_content
	end

#DELETE#id
	  def destroy
		@televisor.destroy
		head :no_content
	  end


private

	def televisor_params
		params.permit(:name, :number)
	end
		     
	def set_televisor
		@televisor =Televisor.find(params[:id])
	end
end
