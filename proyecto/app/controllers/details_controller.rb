class DetailsController < ApplicationController
 before_action :set_sale
  before_action :set_sale_detail, only: [:show, :update, :destroy]

  # GET /sales/:sale_id/details
  def index
    json_response(@sale.details)
  end

  # GET /sales/:_id/details/:id
  def show
    json_response(@detail)
  end

  # POST /sales/:sale_id/details
  def create
    @sale.details.create!(detail_params)
    json_response(@sale, :created)
  end

  # PUT /sales/:sale_id/details/:id
  def update
    @detail.update(detail_params)
    head :no_content
  end

  # DELETE /sales/:sale_id/details/:id
  def destroy
    @detail.destroy
    head :no_content
  end

  private

  def detail_params
    params.permit(:cantidad, :nombre, :precio)
  end

  def set_sale
    @sale = Sale.find_by!(id:|params[:sale_id])
  end

  def set_sale_detail
    @detail = @sale.details.find_by!(id: params[:id]) if @sale
  end
end
