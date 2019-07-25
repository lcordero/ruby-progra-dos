class InventariosController < ApplicationController
  before_action :set_inventario, only: [:show, :update, :destroy]

  # GET /inventarios
  def index
    @inventarios = Inventario.all
    json_response(@inventarios)
  end

  # POST /inventarios
  def create
    @inventario = Inventario.create!(inventario_params)
    json_response(@inventario, :created)
  end

  # GET /inventarios/:id
  def show
    json_response(@inventario)
  end

  # PUT /inventarios/:id
  def update
    @inventario.update(inventario_params)
    head :no_content
  end

  # DELETE /inventarios/:id
  def destroy
    @inventario.destroy
    head :no_content
  end

  private

  def inventario_params
    # whitelist params
    params.permit(:sistema, :via, :fecha_ingreso)
  end

  def set_inventario
    @inventario = Inventario.find(params[:id])
  end
end
