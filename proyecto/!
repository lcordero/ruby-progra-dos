class VentasController < ApplicationController
	before_action :set_ventum, only: [:show, :update, :destroy]

  # GET /ventums
  def index
    @ventums = Ventum.all
    json_response(@ventums)
  end

  # POST /ventums
  def create
    @ventum = Ventum.create!(ventum_params)
    json_response(@ventum, :created)
  end

  # GET /ventums/:id
  def show
    json_response(@ventum)
  end

  # PUT /ventums/:id
  def update
    @ventum.update(ventum_params)
    head :no_content
  end

  # DELETE /ventums/:id
  def destroy
    @ventum.destroy
    head :no_content
  end

  private

  def ventum_params
    # whitelist params
    params.permit(:farmacia, :nombre_paciente, :fecha)
  end

  def set_ventum
    @ventum = Ventum.find(params[:id])
  end
end
