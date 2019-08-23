class PatosController < ApplicationController

  before_action :set_pato
  before_action :set_pato, only: [:show, :update, :destroy]

  # GET 
  def index
    json_response(@pato.patos)
  end
  # GET
  def show
  	  
 
  #set_pato
  def set_pato
	  pato=@Pato.params[:id]

  end	  

  # POST 
  def create
	  @pato=patos.create!(pato_params)
    json_response(@pato, :created)
  end

  # PUT 
  def update
    @pato.update(pato_params)
    head :no_content
  end

   # DELETE 
  def destroy
    @pato.destroy
    head :no_content
  end
  
   #my_patito
  def my_patito
	 my_patito=params.permit

	 if pato=@pato(pato_params)
          
		"Alerta": "El patito "nombre" tiene "edad"años y es de "color""
	 else pato=@pato!
		 "Alerta": "Patito no existe"



   private

  def pato_params
    params.permit(:nombre, :edad, :color)
    nombre=@nombre("nombre")
    edad=@edad("años")
    color=@color("color")

  end

  def set_pato
    @pato = Pato.find(params[:pato_id])
  end

  def set_pato_patos
    @pato = @patos.find_by!(id: params[:id]) 

  end
	 












end
