class DrugstoresController < ApplicationController
before_action :set_drugstore, only: [:show, :update, :destroy]

  # GET /facturas
  def index
    @drugstore = Drugstore.all
    json_response(@drugstore)
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

  private

  def drugstore_params
    # whitelist params
    params.permit(:nombre )
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:id])
  end
end
