class GamesController < ApplicationController
	before_action :set_game, only: [:show, :update, :destroy, :custom]
	#GET /games
	def index
       	  @games = Game.all
	  json_response(@games)
	end

	#Post /games
	def create 
	@game = Game.create!(game_params)
	json_response(@game)
	end

	#Get /games/:id
	def show
	  json_response(@factura)
	end 

	#Put /games/:id
	def update
	  @game.update(game_params)
	  head :no_content
	end

	#Delete /game/:id
	def destroy
 	  @game.destroy
	  head :no_conent
	end

	#Get /custom/:id
	def custom
	  alerta = {
		"alerta": @game[:nombre] + " no funciona"
	  }
	 json_response(alerta) 
	end

	private

	def game_params
	  params.permit(:nombre, :tipo, :tiempo)
	end

	def set_game
	  @game = Game.find(params[:id])
	end
end
