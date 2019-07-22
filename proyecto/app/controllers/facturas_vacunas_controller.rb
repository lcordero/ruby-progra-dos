class FacturasVacunasController < ApplicationController
  before_action :set_FacturaVacuna, only: [:show, :update, :destroy]
  
  # GET /facturas
  def index
    @FacturasVacunas = FacturaVacuna.all
    json_response(@FacturasVacunas)
  end
  
  # POST /facturas
  def create
    @FacturaVacuna = FacturaVacuna.create!(facturavacuna_params)
    json_response(@FacturaVacuna, :created)
  end
  
  # GET /facturas/:id
  def show
    json_response(@FacturaVacuna)
  end  
  
  # PUT /facturas/:id
  def update
    @FacturaVacuna.update(facturavacuna_params)
    head :no_content
  end
  
  # DELETE /facturas/:id
  def destroy
    @FacturaVacuna.destroy
    head :no_content
  end
  
  private
  
  def FacturaVacuna_params
    # whitelist params
    params.permit(:Nombre_del_Cliente, :Apellidos_del_Cliente, :Cedula, :Lugar_de_Residencia, :Fecha_de_Nacimiento, :Total)
  end
  
  def set_FacturaVacuna
    @FacturaVacuna = FacturaVacuna.find(params[:id])
  end
end
