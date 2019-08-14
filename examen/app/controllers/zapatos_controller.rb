class ZapatosController < ApplicationController
  before_action :set_zapato, only: [:show, :destroy, :zapatito]


  def index
    @zapatos = Zapato.all
    json_response(@zapatos)
  end

  def create
    @zapato = Zapato.create!(zapato_params)
    json_response(@zapato, :created)
  end

  def show
    json_response(@zapato)
  end

  def destroy
    @zapato.destroy
    head :no_content
  end
  
   def zapatito
    zapatito = {
        "zapatito" "Zapatito de tipo 'botas',talla'12' y hecho de 'cuero' =D" + @zapato[:tipo, :tamano, :material]
    }
    json_response(zapatito)
  end


  private

  def zapato_params
    params.permit(:tipo, :tamano, :material)
  end

  def set_zapato
    @zapato = Zapato.find(params[:id])
  end
end
