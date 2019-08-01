class ComprasController < ApplicationController
	before_action :set_drugstore
  before_action :set_drugstore_producto, only: [:show, :update, :destroy]

  # GET /drugstores/:drugstore_id/compras
  def index
    json_response(@drugstore.compras)
  end

  # GET /drugstores/:drugstore_id/compras/:id
  def show
    json_response(@producto)
  end

  # POST /drugstores/:drugstore_id/compras
  def create
    @drugstore.compras.create!(compra_params)
    json_response(@drugstore, :created)
  end

  # PUT /drugstores/:drugstore_id/compras/:id
  def update
    @compra.update(compra_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/compras/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def compra_params
    params.permit(:nombredrug)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_compras
    @compra = @drugstore.compras.find_by!(id: params[:id]) if @drugstore
  end
end
