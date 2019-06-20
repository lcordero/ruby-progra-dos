class FacturasController < ApplicationController
# PUT /facturas/:id
def update
@factura.update(factura_params)
head :no_content
end

# DELETE /facturas/:id
def destroy
@factura.destroy
head :no_content
end

private

def factura_params
# whitelist params
        params.permit(:titulo, :creada_por, :fecha, :total)
end

def set_factura
        @factura = Factura.find(params[:id])
end

end
