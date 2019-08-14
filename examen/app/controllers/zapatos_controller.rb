class ZapatosController < ApplicationController
  before_action:set_zapato, only: [:show, :destroy, :zapatito]
  #GET/zapatos
  def index
    @zapatos =Zapato.all
    json_response(@zapatos)
  end

  #POST/zapatos
  def create
    @zapato=Zapato.create!(zapato_params)
    json_response(@zapato, :created)
  end

  #GET/zapatos/:id
  def show
    json_response(@zapato)
  end

  #DELETE/zapatos/:id
  def destroy
    @zapato.destroy
    head :no_content
  end
  #GET/zapatito
   
  def zapatito 
   if zapatito/:id then

    zapato={
            "mensaje": "zapatito de tipo"+@zapato[:tipo], "talla":+@zapato[:tamano], "y hecho de":+@zapato[:material]
     }
    json_response(zapato)
   
   else
    zapato={
	    "mesaje":"zapatito no existe"
    }
    json_response(zapato)
  end

  

   
  
  #GET/custom/custom/:id

  private

  def zapato_params
    params.permit(:tipo, :tamano, :material)
  end

  def set_zapato
    @zapato = Zapato.find(params[:id])
  end
end
