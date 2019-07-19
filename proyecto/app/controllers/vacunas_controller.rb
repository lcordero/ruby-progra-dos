class VacunasController < ApplicationController
  before_action :set_factura_vacuna
  before_action :set_factura_vacuna, only: [:show, :update, :destroy]

  # GET /facturas/:factura_id/vaccine
  def index
   json_response(@factura_vacuna.vacuna)
  end

  # GET /facturas/:factura_id/vaccine/:id
  def show
   json_response(@vacuna)
  end

  # POST /facturas/:factura_id/vaccine
  def create
   @factura_vacuna.vacuna.create!(vacuna_params)
   json_response(@factura_vacuna, :created)
  end

  # PUT /facturas/:factura_id/vaccine/:id
  def update
   @vacuna.update(vacuna_params)
   head :no_content
  end

  # DELETE /facturas/:factura_id/vaccine/:id
  def destroy
   @vacuna.destroy
   head :no_content
  end

  private

  def vacuna_params
   params.permit(:Enfermedad, :Vacuna_Recomendada, :Dosis, :Total_de_la_Vacuna_Usada)
  end

  def set_factura_vacuna
   @factura_vacuna = Factura_Vacuna.find(params[:factura_vacuna_id])
  end

  def set_factura_vacuna_vacuna
   @vacuna = @factura_vacuna.vacuna.find_by!(id: params[:id]) if @factura_vacuna
  end
end
