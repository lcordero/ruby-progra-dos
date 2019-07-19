# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
factura1 = Factura.create(titulo: "Test seed", creada_por: "Team1", fecha: "28/12/1980", total: "1234")
producto1 = Producto.create(factura_id: factura1[:id], nombre: "Prod-Factl", cantidad: 12, precio: 2000)

