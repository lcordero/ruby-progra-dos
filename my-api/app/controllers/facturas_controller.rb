class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :update, :destroy]

  # GET /facturas
  def index
    @facturas = Factura.all
    json_response(@facturas)
  end

  # POST /facturas
   def create
     @producto_temp = @factura.productos.find_by(nombre: producto_params[:nombre])

      if @producto_temp.nil?
        @factura.productos.create!(producto_params)
      else
        @producto_temp[:cantidad] = @producto_temp[:cantidad] + producto_params[:cantidad].to_i
        @producto_temp[:precio] = producto_params[:precio]
        @producto_temp.save
      end
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
end
