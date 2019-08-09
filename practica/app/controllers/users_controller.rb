class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :custom]
  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET#show /users/:id
  def show
    json_response(@user)
  end


  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end
   # GET#custom/custom/:id
  def custom
	  alerta = {
		  "alerta":"Mi usuario" + @user[:nombre]
	  }
       	  json_response(alerta)
  end


  private

  def user_params
    # whitelist params
    params.permit(:nombre, :edad)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
