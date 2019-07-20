class FacturasVacunasController < ApplicationController
  before_action :set_factura_vacuna, only: [:show, :update, :destroy]
  
  # GET /facturas
  def index
    @facturas_vacunas = Factura_Vacuna.all
    json_response(@facturas_vacunas)
  end
  
  # POST /facturas
  def create
    @factura_vacuna = Factura_Vacuna.create!(factura_vacuna_params)
    json_response(@factura_vacuna, :created)
  end
  
  # GET /facturas/:id
  def show
    json_response(@factura_vacuna)
  end  
  
  # PUT /facturas/:id
  def update
    @factura_vacuna.update(factura_vacuna_params)
    head :no_content
  end
  
  # DELETE /facturas/:id
  def destroy
    @factura_vacuna.destroy
    head :no_content
  end
  
    private
  
  def factura_vacuna_params
    # whitelist params
    params.permit(:Nombre_del_Cliente, :Apellidos_del_Cliente, :Cedula, :Lugar_de_Residencia, :Fecha_de_Nacimiento, :Total)
  end
  
  def set_factura_vacuna
    @factura_vacuna = Factura_Vacuna.find(params[:id])
  end
end
