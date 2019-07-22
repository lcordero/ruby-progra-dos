class PharmacyController < ApplicationController
before_action :set_pharmacy, only: [:show, :update, :destroy]

  # GET /Pharmacies
  def index
    @Pharmacies = Pharmacy.all
    json_response(@Pharmacies)
  end

  # POST /Pharmacies
  def create
    @pharmacy = Pharmacy.create!(pharmacy_params)
    json_response(@pharmacy, :created)
  end

  # GET /Pharmacies/:id
  def show
    json_response(@pharmacy)
  end

  # PUT /Pharmacies/:id
  def update
    @pharmacy.update(pharmacy_params)
    head :no_content
  end

  # DELETE /Pharmacies/:id
  def destroy
    @pharmacy.destroy
    head :no_content
  end

  private

  def pharmacy_params
    # whitelist params
    params.permit(:nombre)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end
end
