class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy, :custom]

#GET#index/User
	def index
	   @user = User.all
		json_response(@user)





	end




#POST#create/#user
	def create
		@user= User.create!(user_params)
		json_response(@user)



	end

#GET#show
	def show
		json_response(@user)
	end


#DELETE/#destroy/User/:id

	def destroy
		@user.destroy
	        head :no_content


	end

#GET#custom/custom/:id
	def custom
		 @user = User.find(params[:id])

		alerta = {
	       "alerta": "mi user:"  + @user[:nombre]
              }
                json_response(alerta)		

        end

private

	def user_params
		params.permit(:nombre, :edad)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
