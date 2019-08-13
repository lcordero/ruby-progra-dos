class UsersController < ApplicationController
	before_action :set_User, only: [:show, :destroy, :custom]

#GET#index/User
	def index

		@user = User.all
		json_response(@user)





	end


#GET#show/User/:id

	def show
	 	json_response(@user)

	end


#POST#create/User
	def create
		@user = User.create!(user_params)
		json_response(@user, :created)



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

	def set_User
		@user = User.find(params[:id])
	end
end
