class VacunasController < ApplicationController
  before_action :set_FacturaVacuna
  before_action :set_FacturaVacuna, only: [:show, :update, :destroy]

  after_action :set_FacturaVacuna_total, only: [:update, :create, :destroy]

  # GET /facturas/:factura_id/vaccine
  def index
    json_response(@FacturaVacuna.Vacuna)
  end

  # GET /facturas/:factura_id/vaccine/:id
  def show
    json_response(@Vacuna)
  end

  # POST /facturas/:factura_id/vaccine
  def create
    @FacturaVacuna.Vacuna.create!(vacuna_params)
    json_response(@FacturaVacuna, :created)
  end

  # PUT /facturas/:factura_id/vaccine/:id
  def update
    @Vacuna.update(vacuna_params)
    head :no_content
  end

  # DELETE /facturas/:factura_id/vaccine/:id
  def destroy
    @Vacuna.destroy
    head :no_content
  end

  private

  def Vacuna_params
    params.permit(:Enfermedad, :Vacuna_Recomendada, :Dosis, :Total_de_la_Vacuna_Usada)
  end

  def set_FacturaVacuna
    @FacturaVacuna = FacturaVacuna.find(params[:FacturaVacuna_id])
  end

  def set_FacturaVacuna_Vacuna
    @Vacuna = @FacturaVacuna.Vacuna.find_by!(id: params[:id]) if @FacturaVacuna
  end
end
