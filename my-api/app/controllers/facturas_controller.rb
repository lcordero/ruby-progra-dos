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
    params.permit(:titulo, :creada_por, :fecha, :productos, :total)
  end

  def set_factura
    @factura = Factura.find(params[:id])
  end
<<<<<<< HEAD
  def update_price
    @factura.productos.each do |producto|
	  @Factura.total=@Factura.total+(producto.precio*producto.cantidad)
    end	    
  end
=======

>>>>>>> cef8767f8aa0b2b9800d407aa0ebd863e7986317
end
