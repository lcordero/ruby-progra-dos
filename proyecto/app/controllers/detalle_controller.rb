class DetalleController < ApplicationController
   before_action :set_Pharmacy_detalle, only: [:show, :update, :destroy]
   before_action :set_pharmacy
  # GET /Pharmacys/:phamarcy_id/Detalle
  def index
    @Pharmacys = Pharmacy.all
    json_response(@Pharmacys)
  end

  # POST /Pharmacys/:phamarcy_id/Detalle
  def create
    @Pharmacy = Pharmacy.create!(Pharmacy_params)
    json_response(@Pharmacy, :created)
  end

  # GET /Pharmacys/:pharmacy_id/Detalle/:id
  def show
    json_response(@Pharmacy)
  end

  # PUT /Pharmacys/:phamacy_id/Detalle/:id
  def update
    @Pharmacy.update(Pharmacy_params)
    head :no_content
  end

  # DELETE /Pharmacys/:pharmacy_id/Detalle/:id
  def destroy
    @Pharmacy.destroy
    head :no_content
  end

  private

  def Detalle_params
    # whitelist params
    params.permit(:especialidad)
  end

  def set_Pharmacy
    @Pharmacy = Pharmacy.find(params[:pharmacy_id])
  end
  def set_pharmacy_Pharmacy
    @Detalle = @pharmacy.Detalle.find_by!(id: params[:id]) if @pharmacy
  end
end
