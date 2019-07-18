class RecipesController < ApplicationController
	before_action :set_pharmacy
  before_action :set_pharmacy_recipe, only: [:show, :update, :destroy]

  # GET /pharmacys/:pharmacy_id/recipes
  def index
    json_response(@pharmacy.recipes)
  end

  # GET /pharmacys/:pharmacy_id/recipes/:id
  def show
    json_response(@recipe)
  end

  # POST /pharmacys/:pharmacy_id/recipes
  def create
    @pharmacy.recipes.create!(recipe_params)
    json_response(@pharmacy, :created)
  end

  # PUT /pharmacys/:pharmacy_id/recipes/:id
  def update
    @recipe.update(recipe_params)
    head :no_content
  end

  # DELETE /pharmacys/:pharmacy_id/recipes/:id
  def destroy
    @recipe.destroy
    head :no_content
  end

  private

  def recipe_params
    params.permit(:cliente, :fecha_emicion, :edad, :sexo, :fecha_de_retiro,  :cliente_ID )
  end

  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:pharmacy_id])
  end

  def set_pharmacy_recipe
    @recipe = @pharmacy.recipes.find_by!(id: params[:id]) if @pharmacy
  end
end
