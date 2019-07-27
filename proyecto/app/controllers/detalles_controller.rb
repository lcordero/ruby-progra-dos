class DetallesController < ApplicationController
before_action :set_detalle
  before_action :set_detalle_producto, only: [:show, :update, :destroy]

  # GET /detalles/:detalle_id/productos
  def index
    json_response(@detalle.productos)
  end

  # GET /detalles/:detalle_id/productos/:id
  def show
    json_response(@producto)
  end

  # POST /detalles/:detalle_id/productos
  def create
    @detalle.productos.create!(producto_params)
    json_response(@detalle, :created)
  end

  # PUT /detalles/:detalle_id/productos/:id
  def update
    @producto.update(producto_params)
    head :no_content
  end

  # DELETE /detalles/:detalle_id/productos/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def producto_params
    params.permit(:venta, :cantidad, :nombre, :precio)
  end

  def set_detalle
    @detalle = Detalle.find(params[:detalle_id])
  end

  def set_detalle_producto
    @producto = @detalle.productos.find_by!(id: params[:id]) if @detalle
  end
end
