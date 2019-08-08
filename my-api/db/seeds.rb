# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
factura1 = Factura.create(titulo: "Test Seed", creada_por: "Alonso", fecha: "20/12/09", total: 1200)
producto1 = Producto.create(factura_id: factura1[:id], nombre: "Atun", cantidad: 12, precio: 1200)
