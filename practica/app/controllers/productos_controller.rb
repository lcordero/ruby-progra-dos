class ProductosController < ApplicationController
  before_action :set_factura
  before_action :set_factura_producto, only: [:show, :update, :destroy]

  def index 
    json_response(@factura.productos)
  end

  def show
    json_response(@producto)
  end

  def create
    @factura.productos.create!(producto_params)
    json_response(@factura, :created)
  end

  def update
    @producto.update(producto_params)
    head :no_content
  end

  def destroy
    @producto.destroy
    head :no_content
  end

  def producto_params
    params.permit(:nombre, :cantidad, :precio)
  end

  def set_factura
    @factura = Factura.find(params[:factura_id])
  end

  def set_factura_producto
    @producto = @factura.productos.find_by!(id: params[:id]) if @factura
  end
end
