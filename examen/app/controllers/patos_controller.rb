class PatosController < ApplicationController
	before_action :set_pato, only: [:show, :destroy]

	#get 
	def index
	@pato = Pato.all
	json_response(@patos)
	end

	#post
	def create
	@pato = Pato.create!(pato_params)
        json_response(@pato, :created)
        end

        #get /id
        def show
        json_response(@pato)
        end

        #put
        #def update
        #@pato.update(pato_params)
        #head :no_content
	#end

        #delete	
	def destroy
        @pato.destroy
        head :no_content
        end

        def my_patito
	temp_pato = Pato.find_by(id: params[:id])
	if temp_pato.nil?
	mensaje = "Patito no existe ='("
	else
	mensaje = "El patito "+temp_pato.nombre + " tiene: "+temp_pato.edad.to_s + " a_os de edad y es de color "+temp_pato.color + " "
	end
        json_response(mensaje)
	end

	private
	def pato_params
	params.permit(:nombre, :edad, :color)
	end

	def set_pato
	@pato = Pato.find(params[:id])
	end
end
