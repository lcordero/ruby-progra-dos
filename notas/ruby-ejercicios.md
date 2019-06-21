### 1) Recalcular valor de factura cada vez que agregamos un nuevo producto
### 2) Cuando se agrega un producto y está repetido; actualizar cantidad
### 3) Cuando se borra un producto, no eliminarlo de la BD; sino simplemente desactivarlo
Para este caso se necesita agregar un nuevo campo a la BD para saber si el producto está activo o no

```
$ rails g migration add_activo_to_productos activo:boolean
$ rails db:migrate
```
