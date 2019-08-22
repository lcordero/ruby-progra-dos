class IllnessesController < ApplicationController
  before_action :set_drugstore
  before_action :set_vaccine_illness, only: [:show, :update, :destroy]
  
  def index
    json_response(@vaccine.illnesses)
  end

  
  def show
    json_response(@illness)
  end

  
  def create
    @vaccine.illnesses.create!(illness_params)
    json_response(@vaccine, :created)
  end


  def update
    @illness.update(illness_params)
    head :no_content
  end


  def destroy
    @illness.destroy
    head :no_content
  end

  private

  def illness_params
    params.permit(:enfermedad, :dosis)
  end

  def set_drugstore
    @drugstore = Drugstore.find_by!(id: params[:drugstore_id])
    @vaccine = @drugstore.vaccines.find_by!(id: params[:vaccine_id]) if @drugstore
  end

  def set_illness
    @illness =  @vaccine.illnesses.find_by!(id: params[:id]) if @vaccine
  end
end

