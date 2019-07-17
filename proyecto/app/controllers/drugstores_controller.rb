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

  def filter_drugs
    @drug=params.permit(:drug)
    @temp_drugstore = Drugstore.find(params[:drugstore_id])
    @result=[]
    for supplier in @temp_drugstore.suppliers do
            @checker=supplier.drugs.exists?(name: @drug) if @temp_drugstore
	    @result.push(supplier) if @checker	
            @checker=nil
    end
    json_response(@result)
  end

  private

  def drugstore_params
    # whitelist params
    params.permit(:name)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:id])
  end

end