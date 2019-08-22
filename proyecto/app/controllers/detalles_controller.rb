class DetallesController < ApplicationController

  before_action :set_pharmacy
  before_action :set_pharmacy_detalle, only: [:show, :update, :destroy]
  #after_action :set_date, only: [:create]

  # GET /facturas/:pharmacy_id/detalles
  def index
    temp_medicamento = @medicamento.attributes.merge({:detalles => @medicamento.detalles})
    json_response(temp_medicamento)
      #json_response(@medicamento.detalles)
  end

  # GET /pharmacies/:pharmacy_id/detalles/:id
  def show
    json_response(@detalle)
  end

  # POST /pharmacies/:pharmacy_id/detalles
  def create
    @medicamento.detalles.create!(detalle_params)
    json_response(@medicamento, :created)
  end

  # PUT /pharmacies/:pharmacy_id/detalles/:id
  def update
    @detalle.update(detalle_params)
    head :no_content
  end

  # DELETE /pharmacies/:pharmacy_id/detalles/:id
  def destroy
    @detalle.destroy
    head :no_content
  end


  private

  def detalle_params
    params.permit(:informacion, :presentacion, :dosis, :efecto ,:compania ,:caducidad)
  #  if params.permit[:caducidad]; on_or_before; Date.today do
	#    msg = {
	#	    "mensaje": "caducidad can't be in the past"
	 #  }
#	    json_response(msg)
    #end
 #   end
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @medicamento = @pharmacy.medicamentos.find_by!(id: params[:medicamento_id]) if @pharmacy #es por si no encuentra algo no explote
  end

  def set_pharmacy_detalle
    @detalle = @medicamento.detalles.find_by!(id: params[:id]) if @medicamento
  end

#  def set_date
#	  for date in detalle_params[:caducidad] do
 #   errors.add(:caducidad, "can't be in the past") if
 #     date < Date.today
  #end 
  #end

end
