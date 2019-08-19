class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: [:show, :update, :destroy]

  # GET /pharmacies
  def index
    @pharmacies = Pharmacy.all
    json_response(@pharmacies)
  end

  # POST /pharmacies
  def create
    @pharmacy = Pharmacy.create!(pharmacy_params)
    json_response(@pharmacy, :created)
  end

  # GET /pharmacies/:id
  def show
    json_response(@pharmacy)
  end

  # PUT /pharmacies/:id
  def update
    @pharmacy.update(pharmacy_params)
    head :no_content
  end

  # DELETE /pharmacies/:id
  def destroy
    @pharmacy.destroy
    head :no_content
  end

  # GET /filtro
  def filtro
    
     @pharmacy_temp = Pharmacy.all
     @medicamento_temp = Pharmacy.medicamento.all 
     @detalle_temp_temp = Medicamento.detalles.all(caducidad: params[caducidad])
    
     for fil in @detalle_temp do 
         month2 = Detalles.Medicamento.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 62.days))
   
         month6 =  Detalles.Medicamento.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 124.days))

         year =  Detalles.Medicamento.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 360.days))

   json_response("productos que vencen en 2 meses ": month2)
   json_response("productos que vencen en 6 meses ": month6)
   json_response("productos que vencen en un a_o": year)

  end 
  end
    


  private

  def pharmacy_params
    # parametros para la farmacia
    params.permit(:nombre)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end

end
