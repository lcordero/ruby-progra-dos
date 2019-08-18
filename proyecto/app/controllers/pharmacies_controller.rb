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
   #@detalles = Medicamento.detalles.find.each(id: params[:id])
    @month_two = Detalle.where(caducidad: Date.today..(Date.today + 62.days)).each do |some_number|
    @month_six = Detalle.where(caducidad: Date.today..(Date.today + 186.days)).each do |some_number|
    @year = Detalle.where(caducidad: Date.today..(Date.today + 365.days)).each do |some_number| 
    end
    end
    end

    json_response("productos que vencen en 2 meses": @month_two)
    json_response("productos que vencen en 6 meses": @month_six)
    json_response("productos que vencen en 1 a_o": @year)

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
