class BikesController < ApplicationController
	 #get/bikes
     def index
         @bikes=Bike.all
         json_response(@bikes)
     end
     #post/bikes
     def create
         @bike=Bike.create!(bikes_params)
         json_response(@bike)
     end
     #get/users/:id
     def show
         @bikes=Bike.find(params[:id])
         json_response(@bikes)

     end
     #delete/bikes/:id
     def destroy
         @bike=Bike.find(params[:id])
         @bike.destroy
         head :no_content

     end
     #put/bikes/:id
     def update
             @bike=Bike.find(params[:id])
             @bike.update(bikes_params)
             head :no_content

     end
     #custom
     def custom
             @bike=Bike.find(params[:id])
             alerta={
             "alerta":"no es el año de la motocicleta" + @bike[:nombre]}
              json_response(alerta)
     end
     private
     def bikes_params
         params.permit(:nombre, :modelo)
     end

end
