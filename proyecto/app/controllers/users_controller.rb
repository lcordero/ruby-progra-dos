class UsersController < ApplicationController
	before_action :set_User, only: [:show, :destroy, :custom]

#GET#index/User
	def index
	 	
		@User = User.all
		json_response(@User)





	end


#GET#show/User/:id

	def show
	 	json_response(@User)

	end


#POST#create/User
	def create
		@User = User.create!(user_params)
		json_response(@User, :created)



	end


#DELETE/#destroy/User/:id

	def destroy
		@User.destroy
	        head :no_content
	

	end

#GET#custom/custom/:id
	def custom
		 @User = User.find(params[:id])
		
		alerta = {
	       "alerta": "mi user:"  + @User[:nombre]
              }
                json_response(alerta)		

        end

private

	def user_params
		params.permit(:nombre, :edad)
	end

	def set_User
		@User = User.find(params[:id])
	end
end
