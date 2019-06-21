class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :update, :destroy]

  # GET /facturas
  def index
    @facturas = Factura.all
    json_response(@facturas)
  end

  # POST /facturas
  def create
    @factura = Factura.create!(factura_params)
    json_response(@factura, :created)
  end

  # GET /facturas/:id
  def show
    json_response(@factura)
  end

  # PUT /facturas/:id
  def update
    @factura.update(factura_params)
    head :no_content
  end

  # DELETE /facturas/:id
  def destroy
    @factura.destroy
    head :no_content
  end

  private

  def factura_params
    # whitelist params
    params.permit(:titulo, :creada_por, :fecha, :total)
  end

  def set_factura
    @factura = Factura.find(params[:id])
  end
  def update_price
    @factura.productos.each do |product|
    end	    
  end
end
