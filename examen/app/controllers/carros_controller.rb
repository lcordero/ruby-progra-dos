class CarrosController < ApplicationController
before_action :set_carro
before_action :set_carro, only: [:show, :update, :destroy]
  # GET/carros
  def index
    @carros = Carro.all
    json_response(@carros)
  end
  # POST/carros
  def create
    @carro = Carro.create!(carro_params)
    json_response(@carro, :created)
  end
  # GET/carros/:id
  def show
    json_response(@carro)
  end
  # DELETE/carros/:id
  def destroy
        @carro.destroy
    head :no_content
  end


    #carrito
  def carrito
    if temp_carro.nil?
      mensaje="Carrito marca: "Nissan, color "rojo" con 4 puertas =D"
    temp_carro=Carro.find_by(id: params[:id])
    else
      mensaje="carrito no existe ='("
    json_response(mensaje)
  end

  private
  def carro_params
    params.permit(:marca, :puertas, :color)
  end
  def set_carro
    @carro = Carro.find(params[:id])
  end

end
