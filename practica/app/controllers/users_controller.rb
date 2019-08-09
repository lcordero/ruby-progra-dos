class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :custom]

  def index
    @users = User.all
    json_response(@users)
  end
  
    # POST /facturas
    #Aqui es donde ya se publicara la factura y veremos los datos que tiene que de hecho seran los que logueamos en los params permit y podremos modificar
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end
  
    # GET /facturas/:id
    # Aqui hara la funcion de enseñar las facturas
  def show
    json_response(@user)
  end  
  
    # PUT /facturas/:id
    # Sirve para actualizar la factura
  def update
    @user.update(user_params)
    head :no_content
  end
  
    # DELETE /facturas/:id
    # Sirve para borrar la factura
  def destroy
    @user.destroy
    head :no_content
  end
 
  def custom
	  alerta = {
		  "alerta": "mi usuario es: Alonso" + @user[:nombre]
	  }
	  json_response(alerta)
  end

  private
  
    # Aqui establecemos los parametros de la factura
  def user_params
    # whitelist params
    params.permit(:nombre, :edad)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
   

