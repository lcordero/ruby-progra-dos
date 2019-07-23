class DrugstoresController < ApplicationController
before_action :set_drugstore, only: [:show, :update, :destroy]

  # GET /facturas
  def index
    @drugstores = Drugstore.all
    json_response(@drugstores)
  end

  # POST /facturas
  def create
    @drugstore = Drugstore.create!(drugstore_params)
    json_response(@drugstore, :created)
  end

  # GET /facturas/:id
  def show
    json_response(@drugstore)
  end

  # PUT /facturas/:id
  def update
    @drugstore.update(drugstore_params)
    head :no_content
  end

  # DELETE /facturas/:id
  def destroy
    @drugstore.destroy
    head :no_content
  end

  def filtro_illness
  @illness=params.permit(:illness)
    @temp = Drugstore.find(params[:drugstore_id])  
    @resultado=[]         
    for vaccine in @temp.vaccines do  
       @resultado.push(vaccine) if vaccine.illnesses.exists?(nombre: params[:illness]) 
    end
    json_response(@resultado)
  end

  private

  def drugstore_params
    # whitelist params
    params.permit(:nombre )
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:id])
  end
end
