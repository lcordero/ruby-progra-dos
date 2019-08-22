class VaccinesController < ApplicationController
  before_action :set_drugstore
  before_action :set_drugstore_vaccine, only: [:show, :update, :destroy]

  
  def index
    json_response(@drugstore.vaccines)
  end

  
  def show
    json_response(@vaccine)
  end

  
  def create
    @drugstore.vaccines.create!(vaccine_params)
    json_response(@drugstore, :created)
  end

 
  def update
    @vaccine.update(vaccine_params)
    head :no_content
  end

 
  def destroy
    @vaccine.destroy
    head :no_content
  end

  private

  def vaccine_params
    params.permit(:nombre)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_vaccine
    @vaccine = @drugstore.vaccines.find_by!(id: params[:id]) if @drugstore
  end
end
