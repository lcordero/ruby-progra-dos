class ProductosController < ApplicationController
  before_action :set_inventario
  before_action :set_inventario_producto, only: [:show, :update, :destroy]

  after_action :set_producto_id, only: [:show, :update, :destroy]

  # GET /inventarios/:inventario_id/productos
  def index
    temp_inventario = @inventario.attributes.merge({:productos => @inventario.productos})
    json_response(temp_inventario)
  end

  # GET /inventarios/:inventario_id/productos/:id
  def show
      json_response(@producto)
  end

  # POST /inventarios/:inventario_id/productos
  def create
    @inventario.productos.create!(producto_params)
    json_response(@inventario, :created)
  end

  # PUT /inventarios/:inventario_id/productos/:id
  def update
    @producto.update(producto_params)
    head :no_content
  end

  # DELETE /inventarios/:inventario_id/productos/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def producto_params
    params.permit(:nombre, :cantidad, :fecha_vencimiento)
  end

  def set_inventario
    @inventario = Inventario.find(params[:inventario_id])
  end

  def set_inventario_producto
    @producto = @inventario.productos.find_by!(id: params[:id]) if @inventario
    alerta = ""
      if @producto.cantidad <= 10
       alerta = "Este producto esta por acabarse"
      json_response([alerta] + [@producto])
      else
     @producto = @inventario.productos.find_by!(id: params[:id]) if @inventario
     json_response(@producto)
      end
  end
end
