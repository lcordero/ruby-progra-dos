class VaccinesController < ApplicationController
  before_action :set_drugstore
  before_action :set_drugstore_vaccine, only: [:show, :update, :destroy]

  # GET /facturas/:factura_id/productos
  def index
    json_response(@drugstore.vaccines)
  end

  # GET /facturas/:factura_id/productos/:id
  def show
    json_response(@vaccine)
  end

  # POST /facturas/:factura_id/productos
  def create
    @drugstore.vaccines.create!(vaccine_params)
    json_response(@drugstore, :created)
  end

  # PUT /facturas/:factura_id/productos/:id
  def update
    @vaccine.update(vaccine_params)
    head :no_content
  end

  # DELETE /facturas/:factura_id/productos/:id
  def destroy
    @vaccine.destroy
    head :no_content
  end

  private

  def vaccine_params
    params.permit(:dosis)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_vaccine
    @vaccine = @drugstore.vaccines.find_by!(id: params[:id]) if @drugstore
  end
end
