class DetallesController < ApplicationController
    before_action :set_pharmacy_detalle, only: [:show, :update, :destroy]
    before_action :set_pharmacy
	  # GET /Pharmacies/:phamarcy_id/detalle
  def index
   temp_medico = @medico.attributes.merge({:detalles => @medico.detalles})
   temp_pharmacy=@pharmacy.attributes.merge({:medicos => temp_medico})
   json_response(temp_pharmacy)
  end

  # POST /Pharmacies/:phamarcy_id/detalle
  def create
    @medico.detalles.create!(detalle_params)
     json_response(@medico, :created)
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
    head :no_content
  end

  private

  def detalle_params
  # whitelist params
  params.permit(:especialidad)
  end

  def set_pharmacy
  @pharmacy = Pharmacy.find(params[:pharmacy_id])
  @medico = @pharmacy.medicos.find_by!(id: params[:medico_id]) if @pharmacy
  end
  def set_pharmacy_detalle
  @detalle = @medico.detalles.find_by!(id: params[:id]) if @pharmacy
  end	
end
