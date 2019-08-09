class UsersController < ApplicationController
    # GET /users
  def index	  
    @users = User.all
    json_response(@users)
  end
  
  def custom 
   @user= User.find(params[:id])	  
   alerta= {
	   "alerta":"Mi usuario:" + @user[:nombre]
   } 
   json_response(alerta)
  end
  # POST /users
  def create
    @users = User.create!(users_params)
    json_response(@user)
  end

  # GET /users/:id
  def show
   @users= User.find(params[:id])	  
    json_response(@users)
  end
  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end
  private 
  def users_params
   params.permit(:nombre,:edad)
  end
end 
