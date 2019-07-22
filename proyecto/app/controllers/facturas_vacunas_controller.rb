class FacturasVacunasController < ApplicationController
  before_action :set_facturavacuna, only: [:show, :update, :destroy]
  
  # GET /facturas
  def index
    @facturasvacunas = FacturaVacuna.all
    json_response(@facturasvacunas)
  end
  
  # POST /facturas
  def create
    @facturavacuna = FacturaVacuna.create!(facturavacuna_params)
    json_response(@facturavacuna, :created)
  end
  
  # GET /facturas/:id
  def show
    json_response(@facturavacuna)
  end  
  
  # PUT /facturas/:id
  def update
    @facturavacuna.update(facturavacuna_params)
    head :no_content
  end
  
  # DELETE /facturas/:id
  def destroy
    @facturavacuna.destroy
    head :no_content
  end
  
    private
  
  def facturavacuna_params
    # whitelist params
    params.permit(:Nombre_del_Cliente, :Apellidos_del_Cliente, :Cedula, :Lugar_de_Residencia, :Fecha_de_Nacimiento, :Total)
  end
  
  def set_facturavacuna
    @facturavacuna = FacturaVacuna.find(params[:id])
  end
end
