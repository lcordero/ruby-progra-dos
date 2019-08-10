class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy, :custom]

	# GET /users
	def index
	 @users = User.all
	 json_response(@users)
	end

	# GET /users/:id
	def show
	 json_response(@user)
	end

	# POST /user
	def create
	 @user = User.create!(user_params)
	 json_response(@user, :created)
	end

	# DELETE /user
	def destroy
	 @user.destroy
	 head :no_content
	end

	# GET#custom/custom/:id
	def custom
	 alerta = {"Alerta":"Mi usuario: " + @user[:Nombre]}
	 json_response(alerta)
	end

	private

	def user_params
	 params.permit(:Nombre, :Edad,)
	end
	
	def set_user
		@user = User.find(params[:id])
	end
end
