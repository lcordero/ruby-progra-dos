class GokusController < ApplicationController

	#Get /gokus
	def index
	  @gokus = Goku.all
	  json_response(@gokus)
	end

	#Post /gokus
	def create 
	  @goku = Goku.create!(goku_params)
	  json_response(@goku)
	end

	#Get /gokus/:id
	def show
       	  @goku = Goku.find(params[:id])
	  json_response(@goku)
	end
	
	#Delete /gokus/:id
	def destroy
	  @goku = Goku.find(params[:id])
          @goku.destroy
	  head :no_contend
	end
	#Get custom/:id
	def custom
	  @goku = Goku.find(params[:id])
	  aviso = {
                "alerta": @goku[:hijo] + "a morido por hemorroides"
	   }
	  json_response(aviso)
	end		
      private
	def goku_params
		params.permit(:hijo, :fase)
	end	
end
