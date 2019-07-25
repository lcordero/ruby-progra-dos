class FacturasController < ApplicationController
    before_action :set_ventas, only: [:show, :update, :destroy]
    # GET /facturas
  def index
    @facturas = Ventas.all
    json_response(@facturas)
  end

  # POST /facturas
  def create
    @ventas = Ventas.create!(ventas_params)
    json_response(@ventas, :created)
  end

  # GET /facturas/:id
  def show
    json_response(@ventas)
  end

  # PUT /facturas/:id
  def update
    @ventas.update(ventas_params)
    head :no_content
  end

  # DELETE /facturas/:id
  def destroy
    @ventas.destroy
    head :no_content
  end

  private

  def ventas_params
    # whitelist params
    params.permit(:farmacia, :nombre_paciente, :fecha,)
  end

  def set_venta
    @ventas = Ventas.find(params[:id])
  end
end
