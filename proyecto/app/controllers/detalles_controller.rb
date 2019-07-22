class DetallesController < ApplicationController

  before_action :set_pharmacy
  before_action :set_pharmacy_detalle, only: [:show, :update, :destroy]

  # GET /facturas/:pharmacy_id/detalles
  def index
    json_response(@pharmacy.detalles)
  end

  # GET /pharmacies/:pharmacy_id/detalles/:id
  def show
    json_response(@detalle)
  end

  # POST /pharmacies/:pharmacy_id/detalles
  def create
    @pharmacy.detalles.create!(detalle_params)
    json_response(@pharmacy, :created)
  end

  # PUT /pharmacies/:pharmacy_id/detalles/:id
  def update
    @detalle.update(detalle_params)
    head :no_content
  end

  # DELETE /pharmacies/:pharmacy_id/detalles/:id
  def destroy
    @detalle.destroy
    head :no_content
  end

  private

  def detalle_params
    params.permit(:informacion, :presentacion, :dosis, :efecto ,:compania ,:caducidad)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @medicamento = @pharmacy.medicamentos.find_by!(id: params[:medicamento_id]) if @pharmacy #es por si no encuentra algo no explote
  end

  def set_pharmacy_detalle
    @detalle = @pharmacy.detalles.find_by!(id: params[:id]) if @pharmacy
  end


end
