class MedicoController < ApplicationController
   before_action :set_pharmacy
   before_action :set_pharmacy_medico, only: [:show, :update, :destroy]
  # GET /Pharmacies/:pharmacy_id/medicos
  def index
    json_response(@pharmacy.medicos)
  end

  # POST /Pharmacies/:pharmacy_id/medicos
  def create 
    @pharmacy.medicos.create!(medico_params)
    json_response(@pharmacy, :created)
  end

  # GET /Pharmacies/:pharmacy_id/medicos/:id
  def show
    json_response(@medico)
  end

  # PUT /Pharmacies/:pharmacy_id/medicos/:id
  def update
    @medico.update(medico_params)
    head :no_content
  end

  # DELETE /Pharmacies/:pharmacy_id/medico/:id
  def destroy
    @medico.destroy
    head :no_content
  end

  private

  def medico_params
    params.permit(:nombre)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
  end
  def set_pharmacy_medico
    @medico = @pharmacy.medicos.find_by!(id: params[:id]) if @pharmacy 	    
  end
end
