class ClientesController < ApplicationController
	 before_action :set_factura, :only [:show, :update, :destroy]

  # GET /clientes
  def index
    @clientes = Cliente.all
    json_response(@clientes)
  end

  # POST /cliente
  def create
    @cliente = 	Cliente.create!(cliente_params)
    json_response(@cliente, :created)
  end

  # GET /clientes/:id
  def show
    json_response(@cliente)
  end

  # PUT /clientes/:id
  def update
    @cliente.update(cliente_params)
    head :no_content
  end

  # DELETE /clientes/:id
  def destroy
    @cliente.destroy
    head :no_content
  end
  #esta es la funcion del filtro...que breteada en esto!!!
  def filtroClientes
    @temp_clientes=Cliente.all
    @edadMenor=params.permit[:minimo]
    @edadMayor=params.permit[:maximo]
    @respuesta=[]
    if params[:minimo].to_i > params[:maximo].to_i
	    @respuesta=["Introdusca correctamente las edades"]
	    json_response(@respuesta)
    else
	    for cliente in @temp_clientes do
		    @respuesta.push(cliente) if cliente.edad < params[:maximo].to_i && cliente.edad > params[:minimo].to_i
	    end
	    json_response(@respuesta)
    end

  end

  private

  def cliente_params
    # whitelist params
    params.permit(:nombre, :edad)
  end

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end
end
