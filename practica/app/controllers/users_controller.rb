class UsersController < ApplicationController
	 # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /facturas
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /facturas/:id
  def show
    json_response(@user)
  end

  # PUT /facturas/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /facturas/:id
  def destroy
    @user.destroy
    head :no_content
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
