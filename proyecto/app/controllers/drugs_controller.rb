class DrugsController < ApplicationController
  before_action :set_drugstore
  before_action :set_drug, only: [:show, :update, :destroy]
  # GET /drugstores/:drugstore_id/suppliers
  def index
    json_response(@supplier.drugs)
  end

  # GET /drugstores/:drugstore_id/suppliers/:id
  def show
    json_response(@drug)
  end

  # POST /drugstores/:drugstore_id/suppliers
  def create
    @supplier.drugs.create!(drug_params)
    json_response(@drugstore, :created)
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
    params.permit(:name)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
    @supplier = @drugstore.suppliers.find_by!(params[:supplier_id]) if @drugstore
  end

  def set_drug
    @drug =  @supplier.drugs.find_by!(id: params[:id]) if @supplier
  end
end
