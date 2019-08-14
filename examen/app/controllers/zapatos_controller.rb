class ZapatosController < ApplicationController
  before_action :set_zapato, only: [:show, :update, :destroy]

  # GET
  def index
    @zapatos = Zapato.all
    json_response(@zapatos)
  end

  # POST
  def create
    @zapato = Zapato.create!(zapato_params)
    json_response(@zapato, :created)
  end

  # GET
  def show
    json_response(@zapato)
  end

  # PUT
  def update
    @zapato.update(zapato_params)
    msj="updated the info succesfully :D"
    json_response(msj)
  end

  # DELETE
  def destroy
    @zapato.destroy
    msj="zapato deleted, it no longer exist D:"
    json_response(msj)
  end
  
  def zapatito
    mensaje=""
    temp_zapato=Zapato.find_by(id: params[:id])
    if temp_zapato.nil? 
      mensaje="Zapatito no existe ='("
      json_response(mensaje)
    else
      mensaje="Zapatito de tipo: "+temp_zapato.tipo + " /talla: "+temp_zapato.tamano.to_s + " /made of: "+temp_zapato.material + "   =D"
      json_response(mensaje)
    end
  end
  private

  def zapato_params
    params.permit(:tipo, :tamano, :material)
  end

  def set_zapato
    @zapato = Zapato.find(params[:id])
  end

end
