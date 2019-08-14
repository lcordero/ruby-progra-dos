class ZapatosController < ApplicationController
    before_action :set_zapato, only: [:show, :update, :destroy, :zapatito]

  # GET /zapatos/index
  def index
    @zapatos = Zapato.all
    json_response(@zapatos)
  end

  # POST /zapatos/create
  def create
    @zapato = Zapato.create!(zapato_params)
    json_response(@zapato, :created)
  end

  # GET /zapatos/:id/show
  def show
    json_response(@zapato)
  end

  # DELETE /zapatos/:id/destroy
  def destroy
    @zapato.destroy
    head :no_content
  end
  
  # custom/zapatito/:id
  def zapatito
	 if zapato = {
		  "mensaje" "Zapatito tipo"+@tipo,"talla"+@talla, "hecho"+@hecho
	  }
		 zapatito.find_by(tipo:"botas", talla:"12",hecho:"cuero")

	 else zapato = {
		 "Zapatito no existe ='("
	  }
		 zapatito.find("Zapatito no existe ='("
         end
  end


  private

  def zapato_params
    #whitelist params
    params.permit(:tipo, :tamano, :material)
  end

  def set_zapato
    @zapato = Zapato.find(params[:id])
  end
end
