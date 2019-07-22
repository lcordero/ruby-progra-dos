class DetalleController < ApplicationController
   before_action :set_pharmacy_detalle, only: [:show, :update, :destroy]
   before_action :set_pharmacy
  # GET /Pharmacies/:phamarcy_id/detalle
  def index
    
	  json_response(@pharmacy.detalles)
  end

  # POST /Pharmacies/:phamarcy_id/detalle
  def create
	  @pharmacy.detalles.create!(detalle_params)
    json_response(@pharmacy, :created)
  end

  # GET /Pharmacies/:pharmacy_id/detalle/:id
  def show
    json_response(@detalle)
  end

  # PUT /Pharmacies/:pharmacy_id/detalle/:id
  def update
    @pharmacy.update(detalle_params)
    head :no_content
  end

  # DELETE /Pharmacies/:pharmacy_id/detalle/:id
  def destroy
    @detalle.destroy
    head :no_content
  end

  private

  def detalle_params
    # whitelist params
    params.permit(:especialidad)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @medico = @pharmacy.medico.find_by!(id: params[:medico_id]) if @pharmacy
  end
  def set_pharmacy_detalle
    @detalle = @pharmacy.detalle.find_by!(id: params[:id]) if @pharmacy
  end
end
