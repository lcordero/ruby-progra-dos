class DetallesController < ApplicationController

  before_action :set_cliente
  before_action :set_cliente_detalle, only: [:show, :update, :destroy]

  # GET /clientes/:detalle_id/detalles
  def index
	  @temp_detalles = @cliente.attributes.merge({:detalles=>@cliente.detalles}) 
    json_response(@temp_detalles)
  end

  # GET /clientes/:detalle_id/detalles/:id
  def show
    json_response(@detalle)
  end

  # POST /clientes/:detalle_id/detalles
  def create
    @cliente.detalles.create!(detalle_params)
    json_response(@detalle, :created)
  end

  # PUT /clientes/:detalle_id/detalles/:id
  def update
    @detalle.update(detalle_params)
    head :no_content
  end

  # DELETE /clientes/:detalle_id/detalles/:id
  def destroy
    @detalle.destroy
    head :no_content
  end

  private

  def detalle_params
    params.permit(:enfermedad, :sintomas, :medicacion)
  end

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def set_cliente_detalle
    @detalle = @cliente.detalles.find_by!(id: params[:id]) if @detalle
  end

end
