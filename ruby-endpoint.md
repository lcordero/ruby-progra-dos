## Información General
Pasos para crear mi propio Endpoint.
Para efectos de esta guia vamos a crear un endpoint llamado "factura" que a su vez va a estar asociado al endpoint de "productos".

## 1) Crear modelo factura & productos + archivo de DB + referencias
```
$ rails g model Factura titulo:string creada_por:string fecha:date total:integer
$ rails g model Producto nombre:string cantidad:integer precio:integer
```
Agregamos la referencia entre Factura y Producto.
1.1) Vamos al archivo: ```db/migrate/[timestamp]_create_productos.rb``` y agregamos la siguiente línea después de: ```create_table :productos do |t|```

```
  t.references :factura, foreign_key: true
```

1.2) Vamos al archivo: ```app/models/factura.rb```  y después de ```class Factura < ApplicationRecord``` agregamos:

```
  has_many :productos, dependent: :destroy
```

1.3) Vamos al archivo: ```app/models/producto.rb``` y después de ```class Producto < ApplicationRecord``` agregamos:

```
  belongs_to :factura
```

## 2) Ejecutamos el migrate
```
$ rails db:migrate
```

## 3) Crear Controladores
```
$ rails g controller Facturas
$ rails g controller Productos
```

3.1) Dentro del archivo ```app/controllers/facturas_controller.rb"``` después de ```class FacturasController < ApplicationController``` agregamos:

```
  before_action :set_factura, only: [:show, :update, :destroy]

  # GET /facturas
  def index
    @facturas = Factura.all
    json_response(@facturas)
  end

  # POST /facturas
  def create
    @factura = Factura.create!(factura_params)
    json_response(@factura, :created)
  end

  # GET /facturas/:id
  def show
    json_response(@factura)
  end

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
```

3.2) Dentro del archivo ```app/controllers/productos_controller.rb``` después de ```class ProductosController < ApplicationController``` agregamos:

```
  before_action :set_factura
  before_action :set_factura_producto, only: [:show, :update, :destroy]

  # GET /facturas/:factura_id/productos
  def index
    json_response(@factura.productos)
  end

  # GET /facturas/:factura_id/productos/:id
  def show
    json_response(@producto)
  end

  # POST /facturas/:factura_id/productos
  def create
    @factura.productos.create!(producto_params)
    json_response(@factura, :created)
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
```

## 4) Creamos las rutas del Endpoint
4.1) En el archivo ```config/routes.rb``` después de ```Rails.application.routes.draw do``` agregamos:

```
  resources :facturas do
    resources :productos
  end
```
4.2) Creamos la nueva ruta
```
$ rails routes
```

## 5) Iniciar server y testear con nuestro endpoint ```/facturas``` y sus hijos:
```
                   Prefix Verb   URI Pattern                                                                              Controller#Action
        factura_productos GET    /facturas/:factura_id/productos(.:format)                                                productos#index
                          POST   /facturas/:factura_id/productos(.:format)                                                productos#create
         factura_producto GET    /facturas/:factura_id/productos/:id(.:format)                                            productos#show
                          PATCH  /facturas/:factura_id/productos/:id(.:format)                                            productos#update
                          PUT    /facturas/:factura_id/productos/:id(.:format)                                            productos#update
                          DELETE /facturas/:factura_id/productos/:id(.:format)                                            productos#destroy
                 facturas GET    /facturas(.:format)                                                                      facturas#index
                          POST   /facturas(.:format)                                                                      facturas#create
                  factura GET    /facturas/:id(.:format)                                                                  facturas#show
                          PATCH  /facturas/:id(.:format)                                                                  facturas#update
                          PUT    /facturas/:id(.:format)                                                                  facturas#update
                          DELETE /facturas/:id(.:format)                                                                  facturas#destroy

```

5.1) Iniciar server:
```
$ rails s -b 0.0.0.0 -p <port>
```

http://35.209.175.42:*<**port**>*/facturas
