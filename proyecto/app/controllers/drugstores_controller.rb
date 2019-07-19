class DrugstoresController < ApplicationController
  before_action :set_drugstore, only: [:show, :update, :destroy]

  # GET /drugstores
  def index
    @drugstores = Drugstore.all
    json_response(@drugstores)
  end

  # POST /drugstores
  def create
    name_drugstore=drugstore_params
    name_drugstore[:name]=name_drugstore[:name][0..14]
    @drugstore = Drugstore.create!(name_drugstore)
    json_response(@drugstore, :created)
  end

  # GET /drugstores/:id
  def show
    json_response(@drugstore)
  end

  # PUT /drugstores/:id
  def update
    @drugstore.update(drugstore_params)
    head :no_content
  end

  # DELETE /drugstores/:id
  def destroy
    @drugstore.destroy
    head :no_content
  end

  #Funcion para filtrar suppliers por medio de sus medicamentos
  def filter_drugs
    @drug=params.permit(:drug)  #Aqui es donde obtenemos el input del usuario, variable la cual aplicara el filtro
    @temp_drugstore = Drugstore.find(params[:drugstore_id])  #farmacia temporal la cual manipularemos
    @result=[]            #lista vacia la cual llenaremos con los que cumplan los requisitos
    for supplier in @temp_drugstore.suppliers do   #un for el cual recorrera la lista de la farmacia temporal buscando uno por uno
	    @result.push(supplier) if supplier.drugs.exists?(name: params[:drug])  #aqui hacemos el push del supplier si se cumple la condicion de que el nombre del producto sea igual
	     
    end
    #esta es una var unicamente creada para dar una alerta si no se encuentra nada
    alerta = {
	    alert: "No se encontro ningun resultado"
    }
    #devolveremos los datos dependiendo del resultado
    json_response(alerta) if @result[0].nil?
    print_drugstore = @temp_drugstore.attributes.merge({:suppliers => @result}) 
    json_response(print_drugstore) if !@result[0].nil?
  end

  private
  def drugstore_params
    # whitelist params
    params.permit(:name)
  end

  def set_drugstore
    @drugstore = Drugstore.find(params[:id])
  end

end
