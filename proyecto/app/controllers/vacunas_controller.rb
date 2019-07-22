class VacunasController < ApplicationController
  before_action :set_facturavacuna
  before_action :set_facturavacuna, only: [:show, :update, :destroy]

  after_action :set_facturavacuna_total, only: [:update, :create, :destroy]

  # GET /facturas/:factura_id/vaccine
  def index
    json_response(@facturavacuna.vacuna)
  end

  # GET /facturas/:factura_id/vaccine/:id
  def show
    json_response(@vacuna)
  end

  # POST /facturas/:factura_id/vaccine
  def create
    @facturavacuna.vacuna.create!(vacuna_params)
    json_response(@facturavacuna, :created)
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

  def set_facturavacuna
    @facturavacuna = FacturaVacuna.find(params[:facturavacuna_id])
  end

  def set_facturavacuna_vacuna
    @vacuna = @facturavacuna.vacuna.find_by!(id: params[:id]) if @facturavacuna
  end
end
