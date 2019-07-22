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

  private

  def pharmacy_params
    # parametros para la farmacia
    params.permit(:nombre)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end

end
