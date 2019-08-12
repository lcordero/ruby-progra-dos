class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :update, :destroy]

  def index
    @facturas = Factura.all
    json_response(@facturas)
  end 

  def create
    @factura = Factura.create!(factura_params)
    json_response(@factura)
  end

  def show
    json_response(@factura)
  end

  def update
    Factura.update(factura_params)
    head :no_content
  end

  def destroy
    Factura.destroy
    head :no_content
  end

  private

  def factura_params
    params.permit(:nombre_del_cliente, :apellidos_del_cliente, :cedula)
  end

  def set_factura
    @factura = Factura.find(params[:id])
  end  
end
