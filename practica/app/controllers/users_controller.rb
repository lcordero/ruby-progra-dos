class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :destroy]
	
# GET #index /User
def index 
  @user = User.all
  json_response(@user)

end

# GET #SHOW /User
def show
   @user = User.find(params[:id])
   json_response(@user)

end


# POST /USERS
def create 
   @user = User.create!(user_params)
   json_response(@user, :created)

end


# Delete /User
def destroy 
    @user.destroy
    head :no_content
end

# GET #CUSTOM /User
def custom
 my_variable = {
	 "alerta": "mi user: "+@user[:Nombre]
 }
 json_response(my_variable)

end

  private

def user_params
 params.permit(:Nombre, :edad)
end
def set_user
 @user = User.find(params[:id])

end
   
end
