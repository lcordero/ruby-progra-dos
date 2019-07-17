class FacturasVaccineController < ApplicationController
before_action :set_facturavaccine, only: [:show, :update, :destroy]
  
    # GET /facturas
    def index
      @facturasvaccine = FacturaVaccine.all
      json_response(@facturasvaccine)
    end
  
    # POST /facturas
    def create
      @facturavaccine = FacturaVaccine.create!(facturavaccine_params)
      json_response(@facturavaccine, :created)
    end
  
    # GET /facturas/:id
    def show
      json_response(@facturavaccine)
    end  
  
    # PUT /facturas/:id
    def update
      @facturavaccine.update(facturavaccine_params)
      head :no_content
    end
  
    # DELETE /facturas/:id
    def destroy
      @facturavaccine.destroy
      head :no_content
    end
  
    private
  
    def facturavaccine_params
      # whitelist params
      params.permit(:NombredelaPersona, :ApellidosdelaPersona, :Cedula, :LugardeResidencia, :Total)
    end
  
    def set_facturavaccine
      @facturavaccine = FacturaVaccine.find(params[:id])
    end
  end
