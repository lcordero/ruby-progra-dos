class DrugsController < ApplicationController
  before_action :set_pharmacy
  before_action :set_drug, only: [:show, :update, :destroy]
  # GET /pharmacys/:pharmacy_id/recipes
  def index
	  @temp_pharmacy = @pharmacy.attributes.merge({:recipes => @pharmacy.recipe,:drugs => @temp_pharmacy.recipe.drug})
	  #@temp_ =@recipe.attributes.merge({:drugs => @temp_pharmacy}) 
          json_response(@temp_pharmacy)
	  
  
	  
  end

  # GET /pharmacys/:pharmacy_id/recipes/:id
  def show
    json_response(@drug)
  end

  # POST /pharmacys/:pharmacy_id/recipes
  def create
    @recipe.drugs.create!(drug_params)
    json_response(@recipe, :created)
  end

  # PUT /pharmacys/:pharmacy_id/recipes/:id
  def update
    @drug.update(drug_params)
    head :no_content
  end

  # DELETE /pharmacys/:pharmacy_id/recipes/:id
  def destroy
    @drug.destroy
    head :no_content
  end

  private

  def drug_params
    params.permit(:nombre, :dosis)
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
    @recipe = @pharmacy.recipes.find_by!(id: params[:recipe_id]) if @pharmacy
  end

  def set_drug
    @drug =  @recipe.drugs.find_by!(id: params[:id]) if @recipe
  end
end