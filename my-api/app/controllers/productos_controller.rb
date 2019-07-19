
class ProductosController < ApplicationController
  before_action :set_factura
  before_action :set_factura_producto, only: [:show, :update, :destroy]
  after_action :set_factura_total, only: [:update, :create, :destroy]
  # GET /facturas/:factura_id/productos
  def index
    temp_factura = @factura.attributes.merge({:productos => @factura.productos})
    #debuger 
    puts "TESTING #1"

    #factura_producto ={
#	    factura:@factura,
#	    productos:@factura.productos,   
#	    alerta: "esta factura es mia"
#   }
      json_response(temp_factura)
  end

  # GET /facturas/:factura_id/productos/:id
  def show
    json_response(@producto)
  end

  # POST /facturas/:factura_id/productos
  def create
    @producto_temp = @factura.productos.find_by(nombre: producto_params[:nombre])
    if @producto_temp.nil?
      @factura.productos.create!(producto_params)
    else
      @producto_temp[:cantidad] = @producto_temp[:cantidad] + producto_params[:cantidad].to_i
      @producto_temp[:precio] = producto_params[:precio]
      @producto_temp.save
    end
    json_response(@factura, :create!)
  end

  # PUT /facturas/:factura_id/productos/:id
  def update
    @producto.update(producto_params)
    head :no_content
  end

  # DELETE /facturas/:factura_id/productos/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def producto_params
    params.permit(:nombre, :cantidad, :precio)
  end

  def set_factura
    @factura = Factura.find(params[:factura_id])
  end

  def set_factura_producto
    @producto = @factura.productos.find_by!(id: params[:id]) if @factura

  end
  def set_factura_total
   @factura_sub_total = 0

   @factura.productos.each do |producto|
    @factura_sub_total = @factura_sub_total + (producto.cantidad * producto.precio)

   end
   @factura.total = @factura_sub_total
   @factura.save
  end
end