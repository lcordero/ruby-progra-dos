	class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: [:show, :update, :destroy]

  # GET /Pharmacies
  def index
    @pharmacy = Pharmacy.all
    json_response(@pharmacy)
  end

  # POST /Pharmacies
  def create
    @pharmacy = Pharmacy.create!(pharmacy_params)
    json_response(@pharmacy, :created)
  end

  # GET /Pharmacies/:id
  def show
    json_response(@pharmacy)
  end

  # PUT /Pharmacies/:id
  def update
    @pharmacy.update(pharmacy_params)
    head :no_content
  end

  # DELETE /Pharmacies/:id
  def destroy
    @pharmacy.destroy
    head :no_content
  end
  def filtro
    @detalle=params.permit(:detalle)
    @temp_pharmacy = Pharmacy.find_by!(id: params[:pharmacy_id])
    @result=[]
    for medico in @temp_pharmacy.medicos do
	 @result.push(medico) if medico.detalles.exists?(especialidad: params[:detalle])

    end
    json_response(@result)
  end	  

  private

  def pharmacy_params
    # whitelist params
    params.permit(:nombre)
  end

  def set_factura
    @pharmacy = Pharmacy.find(params[:id])
  end
end 
