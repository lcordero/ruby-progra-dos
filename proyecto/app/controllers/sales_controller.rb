class SalesController < ApplicationController
	 before_action :set_sale, only: [:show, :update, :destroy]

  # GET /sales
  def index
    @sales = Sale.all
    json_response(@sales)
  end

  # POST /sales
  def create
    @sale = Sale.create!(sale_params)
    json_response(@sale, :created)
  end

  # GET /sales/:id
  def show
    json_response(@sale)
  end

  # PUT /sales/:id
  def update
    @sale.update(sale_params)
    head :no_content
  end

  # DELETE /sales/:id
  def destroy
    @sale.destroy
    head :no_content
  end

  private

  def sale_params
    # whitelist params
    params.permit(:fecha, :paciente, :edad)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end
end
