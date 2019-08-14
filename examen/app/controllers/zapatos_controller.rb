class ZapatosController < ApplicationController

  before_action :set_zapatito, only: [:show, :create, :destroy]
  
    #GET /zapato
    def index
      @zapato = Zapato.all
      json_response(@zapato)
    end
  
    # POST /zapato
    def create
      @zapato = Zapato.create!(params)
      json_response(@zapato, :created)
    end
  
    # GET /zapato/:id
    def show
      json_response(@zapato)
    end
  
    # DELETE /zapato/:id
    def destroy
      @zapato.destroy
      head :no_content
    end
    def zapatito
      @mensaje=""
      una_perra = Zapato.find_by(id: params[:id])
      if zapato.nil?
        @mensaje="Zapatito no existe ='("
        json_response(@mensaje)
      else
        @mensaje="Zapatito de tipo: "+ una_perra.tipo + " talla: "+ una_perra.tamano.to_s + " hecho de: "+ una_perra.material + "=D"
        json_response(@mensaje)
      end
    end
   private
  
    def zapatito_params
      params.permit(:tipo, :tamano, :material)
    end
  
    def set_zapatito
      @zapatito = Zapato.find(params[:id])
    end
  
end

