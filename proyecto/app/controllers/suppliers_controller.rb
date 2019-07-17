class SuppliersController < ApplicationController
  before_action :set_drugstore
  before_action :set_drugstore_supplier, only: [:show, :update, :destroy]

  # GET /drugstores/:drugstore_id/suppliers
  def index
    json_response(@drugstore.suppliers)
  end

  # GET /drugstores/:drugstore_id/suppliers/:id
  def show
    json_response(@supplier)
  end

  # POST /drugstores/:drugstore_id/suppliers
  def create
    @drugstore.suppliers.create!(supplier_params)
    json_response(@drugstore, :created)
  end

  # PUT /drugstores/:drugstore_id/suppliers/:id
  def update
    @supplier.update(supplier_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/suppliers/:id
  def destroy
    @supplier.destroy
    head :no_content
  end

  private

  def supplier_params
    params.permit(:name, :agent)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_supplier
    @supplier = @drugstore.suppliers.find_by!(id: params[:id]) if @drugstore
  end
end
