class DatilusersController < ApplicationController
before_action :set_usuario
  before_action :set_usuario_datiluser, only: [:show, :update, :destroy]

  # GET /usuario/:usuario_id/datilusers
  def index
    json_response(@usuario.datilusers)
  end

  # GET /usuario/:usuario_id/datilusers/:id
  def show
    json_response(@datiluser)
  end

  # POST /usuario/:usuario_id/datilusers
  def create
    @usuario.datilusers.create!(datiluser_params)
    json_response(@usuario, :created)
  end

  # PUT /usuario/:usuario_id/datilusers/:id
  def update
    @datiluser.update(datiluser_params)
    head :no_content
  end

  # DELETE /usuario/:usuario_id/datilusers/:id
  def destroy
    @datilusers.destroy
    head :no_content
  end

  private

  def datiluser_params
    params.permit(:direction, :telf, :sex)
  end

  def set_usuario
    @usuario = Usuario.find(params[:usuario_id])
  end

  def set_usuario_datiluser
	  @datiluser = @usuarios.datiluser.find_by!(id: params[:id]) if @usuario
  end
end
