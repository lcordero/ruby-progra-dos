class UsersController < ApplicationController
before_action :set_user, only: [:show, :update, :destroy, :custom]

  #GET /users
  def index
    @user = User.all
    json_response(@user)
  end

  # POST /user
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /user/:id
  def show
    json_response(@user)
  end

  # PUT /user/:id
  def update
    @factura.update(factura_params)
    head :no_content
  end

  # DELETE /facturas/:id
  def destroy
    @user.destroy
    head :no_content
  end
 
 def custom
	alerta = {
	"alerta": "mi user:" + @user[:nombre]
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
