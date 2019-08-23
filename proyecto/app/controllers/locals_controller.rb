class LocalsController < ApplicationController
  before_action :set_drugstore
  before_action :set_drugstore_local, only: [:show, :update, :destroy]
  before_action :log_request

  # GET /drugstores/:drugstore_id/locals
  def index
    json_response(@drugstore.locals)
  end

  # GET /drugstores/:drugstore_id/locals/:id
  def show
    json_response(@local)
  end

  # POST /drugstores/:drugstore_id/locals
  def create
    @drugstore.locals.create!(local_params)
    json_response(@drugstore, :created)
  end

  # PUT /drugstores/:drugstore_id/locals/:id
  def update
    @local.update(local_params)
    head :no_content
  end

  # DELETE /drugstores/:drugstore_id/locals/:id
  def destroy
    @local.destroy
    head :no_content
  end

  #Filtro
  def filter_locals
	  local_params.permit(local)
          group_by:local
  





  private

  def local_params
    params.permit(:provincia, :canton, :contacto)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:drugstore_id])
  end

  def set_drugstore_local
    @local = @drugstore.locals.find_by!(id: params[:id]) if @drugstore
  end

end
