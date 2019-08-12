class GokusController < ApplicationController
  #Get/gokus 
  def index 
     @gokus = Goku.all
     json_response(@gokus)
  end
  #Get/custom/:id
  def custom
     @goku = Goku.find(params[:id])
    alerta = {"alerta":"No es el hijo de Goku:" + @goku[:hijo]
    } 
    json_response(alerta)
  end
  #Post/gokus
  def create
    @gokus = Goku.create!(gokus_params)
     json_response(@goku)
  end
  #Get/gokus/:id
  def show
	 #@gokus = Goku.find(param[:id])
	 json_response(@gokus)
  end 
  #Delete/gokus/:id
  def destroy
   @goku = Goku.find(params[:id])
   @goku.destroy
    head :not_content   
  end
 private 
  def gokus_params
   params.permit(:hijo,:fase)     	
 
  end 	
end

