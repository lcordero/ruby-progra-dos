class IllnessesController < ApplicationController
  before_action :set_drugstore
  before_action :set_illness, only: [:show, :update, :destroy]
  # GET /drugstores/:drugstore_id/suppliers
  def index
    json_response(@vaccine.illnesses)
  end

  # GET /drugstores/:drugstore_id/suppliers/:id
  def show
    json_response(@illness)
  end

  # POST /drugstores/:drugstore_id/suppliers
  def create
    @vaccine.illnesses.create!(illness_params)
    json_response(@vaccine, :created)
  end

  # PUT /drugstores/:drugstore_id/suppliers/:id
  def update
    @illness.update(illness_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/suppliers/:id
  def destroy
    @illness.destroy
    head :no_content
  end

  private

  def illness_params
    params.permit(:nombre)
  end

  def set_drugstore
    @drugstore = Drugstore.find_by!(id: params[:drugstore_id])
    @vaccine = @drugstore.vaccines.find_by!(id: params[:vaccine_id]) if @drugstore
  end

  def set_illness
    @illness =  @vaccine.illnesses.find_by!(id: params[:id]) if @vaccine
  end
end

