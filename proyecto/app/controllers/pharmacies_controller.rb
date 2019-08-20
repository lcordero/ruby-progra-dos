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
     @resultado=[]
     parametro=params.permit(:filtro)
     for pharmacy in @pharmacy_temp do
	     check=false
	     for med in pharmacy.medicamentos do
		     if params[:filtro] == 1
			     check=true if med.detalles.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 62.days))
		     
		     end
		     if params[:filtro]==2 
			     check=true if med.detalles.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 124.days))
		     
		     end
		     if params[:filtro] == 3 
			     check=true if med.detalles.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 360.days))
		     
	             end
		     @resultado.push(med)
	     end

         #month2 = pharmacy.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 62.days))
   
         #month6 =  Detalles.Medicamento.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 124.days))

         #year =  Detalles.Medicamento.where("caducidad BETWEEN ? and ": Date.today..(Date.today + 360.days))

    #json_response(@resultado)
    end
    json_response(@resultado)
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
