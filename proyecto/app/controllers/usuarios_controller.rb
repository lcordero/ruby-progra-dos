class UsuariosController < ApplicationController
before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    json_response(@usuarios)
  end

  # POST /usuarios
  def create
    @usuario = Usuario.create!(usuario_params)
    json_response(@usuario, :created)
  end

  # GET /usuario/:id
  def show
    json_response(@usuario)
  end

  # PUT /usuarios/:id
  def update
    @usuarios.update(usuarios_params)
    head :no_content
  end

  # DELETE /usuario/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def usuario_params
    # whitelist params
    params.permit(:nombre, :apellidos, :edad, :cedula)
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
