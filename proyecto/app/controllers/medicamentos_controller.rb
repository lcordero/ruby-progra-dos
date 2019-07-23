class MedicamentosController < ApplicationController
    before_action :set_pharmacy
    before_action :set_pharmacy_medicamento, only: [:show, :update, :destroy]

  # GET /pharmacies/:pharmacy_id/medicamentos
  def index
    temp_pharmacy = @pharmacy.attributes.merge({:medicamentos => @pharmacy.medicamentos})
	  
     #json_response(@pharmacy.medicamentos)
    jsoon_reponse(temp_pharmacy)
  end

  # GET /pharmacies/:pharmacy_id/medicamentos/:id
  def show
    json_response(@medicamento)
  end

  # POST /pharmacies/:pharmacy_id/medicamentos
  def create
    @pharmacy.medicamentos.create!(medicamento_params)
    json_response(@pharmacy, :created)
  end

  # PUT /pharmacies/:pharmacy_id/medicamentos/:id
  def update
    @medicamento.update(medicamento_params)
    head :no_content
  end

  # DELETE /pharmacies/:pharmacy_id/medicamentos/:id
  def destroy
    @medicamento.destroy
    head :no_content
  end

  private

  def medicamento_params
    params.permit(:dato)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
  end

  def set_pharmacy_medicamento
    @medicamento = @pharmacy.medicamentos.find_by!(id: params[:id]) if @pharmacy
  end

end
