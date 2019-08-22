class CompradetallesController < ApplicationController
  before_action :set_drugstore
  before_action :set_drug, only: [:show, :update, :destroy]
  # GET /drugstores/:drugstore_id/suppliers
  def index
    json_response(@compras.compradetalles)
  end

  # GET /drugstores/:drugstore_id/suppliers/:id
  def show
    json_response(@drug)
  end

  # POST /drugstores/:drugstore_id/suppliers
  def create
    @compras.compradetalles.create!(drug_params)
    json_response(@compras, :created)
  end

  # PUT /drugstores/:drugstore_id/suppliers/:id
  def update
    @drug.update(drug_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/suppliers/:id
  def destroy
    @drug.destroy
    head :no_content
  end

  private

  def drug_params
    params.permit(:nomprovee, :fecha, :cantidad, :costo, :presentacion)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
    @compras = @drugstore.compras.find_by!(id: params[:compra_id]) if @drugstore
  end

  def set_drug
    @drug =  @compras.compradetalles.find_by!(id: params[:id]) if @compras
  end
end

