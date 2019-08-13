class AutosController < ApplicationController
   #get/autos
    def index
        @autos=Auto.all
	json_response(@autos)
    end
    #Post/autos
    def create
	@auto= Auto.create!(autos_params)
	json_response(@auto)
    end
    #Get/users/:id
    def show
	@autos=Auto.find(params[:id])
	json_response(@autos)
    end
    #Delete/autos/:id
    def destroy

	 @auto.destroy
	 head :no_content
    end
    #Put/autos/:id
    def update
        @auto.update(autos_params)
	head :no_content
    end

    def custom
	    @auto=Auto.find(params[:id])

	    alerta={
	   "alerta":"no es el año del carro:" + @auto[:nombre]}
    	   json_response(alerta)
     
    end

    private
    def autos_params
	    params.permit(:nombre, :modelo)
    end
end
