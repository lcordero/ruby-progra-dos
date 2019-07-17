class VaccinesController < ApplicationController
before_action :set_facturavaccine
before_action :set_factura_vaccine, only: [:show, :update, :destroy]

   # GET /facturas/:factura_id/vaccine
   def index
    json_response(@facturavaccine.vaccine)
   end

   # GET /facturas/:factura_id/vaccine/:id
   def show
    json_response(@vaccine)
   end

   # POST /facturas/:factura_id/vaccine
   def create
    @facturavaccine.vaccine.create!(vaccine_params)
    json_response(@facturavaccine, :created)
   end

   # PUT /facturas/:factura_id/vaccine/:id
   def update
    @vaccine.update(vaccine_params)
    head :no_content
   end

   # DELETE /facturas/:factura_id/vaccine/:id
   def destroy
    @vaccine.destroy
    head :no_content
   end

   private

   def vaccine_params
    params.permit(:Enfermedad, :VacunaRecomendada, :Dosis, :TotaldelaVacunausada)
   end

   def set_facturavaccine
    @facturavaccine = FacturaVaccine.find(params[:facturavaccine_id])
   end

   def set_facturavaccine_vaccine
    @vaccine = @facturavaccine.vaccine.find_by!(id: params[:id]) if @facturavaccine
   end
  end
