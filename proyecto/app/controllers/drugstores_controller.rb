class DrugstoresController < ApplicationController
  before_action :set_drugstore, only: [:show, :update, :destroy]

  # GET /drugstores
  def index
    @drugstores = Drugstore.all
    json_response(@drugstores)
  end

  # POST /drugstores
  def create
    @drugstore = Drugstore.create!(drugstore_params)
    json_response(@drugstore, :created)
  end

  # GET /drugstores/:id
  def show
    json_response(@drugstore)
  end

  # PUT /drugstores/:id
  def update
    @drugstore.update(drugstore_params)
    head :no_content
  end

  # DELETE /drugstores/:id
  def destroy
    @drugstore.destroy
    head :no_content
  end
  
  def filtro
    @drugstore_temp= Drugstore.find_by(id: params[:drugstore_id])
    resultado=[]
    provincia_temp=params.permit[:canton]
    canton_temp=params.permit[:provincia]
    #puts(@drugstore_temp.nombre)
    locales=Local.all
    for local_t in locales
	    resultado.push(local_t) if local_t.canton == params[:canton] or local_t.provincia == params[:provincia] 
    end
    json_response(resultado)
  end

  private

  def drugstore_params
    # whitelist params
    params.permit(:nombre)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:id])
  end


end
