class ComprasController < ApplicationController
	before_action :set_drugstore
  before_action :set_drugstore_producto, only: [:show, :update, :destroy]

  # GET /drugstores/:drugstore_id/productos
  def index
    json_response(@drugstore.productos)
  end

  # GET /drugstores/:drugstore_id/productos/:id
  def show
    json_response(@producto)
  end

  # POST /drugstores/:drugstore_id/productos
  def create
    @drugstore.productos.create!(producto_params)
    json_response(@drugstore, :created)
  end

  # PUT /drugstores/:drugstore_id/productos/:id
  def update
    @producto.update(producto_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/productos/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def producto_params
    params.permit(:nombre, :cantidad, :precio)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_producto
    @producto = @drugstore.productos.find_by!(id: params[:id]) if @drugstore
  end
end
