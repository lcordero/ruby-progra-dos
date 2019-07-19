# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
drugstore1=Drugstore.create(name: "The Best Dope")
#
#
supplier1=Supplier.create(drugstore_id: drugstore1[:id], name: "Sinaloa", agent: "Chapo")
supplier2=Supplier.create(drugstore_id: drugstore1[:id], name: "Juarez Cartel", agent: "Juarez")
supplier3=Supplier.create(drugstore_id: drugstore1[:id], name: "Medellin", agent: "Escobar")
supplier4=Supplier.create(drugstore_id: drugstore1[:id], name: "Los Z", agent: "El Mono")
drug1=Drug.create(supplier_id: supplier1[:id], name: "cocaine")
drug2=Drug.create(supplier_id: supplier1[:id], name: "crack")
drug3=Drug.create(supplier_id: supplier2[:id], name: "LSD")
drug4=Drug.create(supplier_id: supplier3[:id], name: "extasis")
drug5=Drug.create(supplier_id: supplier4[:id], name: "meth")
drug6=Drug.create(supplier_id: supplier2[:id], name: "cocaine")
drug7=Drug.create(supplier_id: supplier3[:id], name: "crack")
drug8=Drug.create(supplier_id: supplier4[:id], name: "LSD")
drug9=Drug.create(supplier_id: supplier2[:id], name: "extasis")
drug10=Drug.create(supplier_id: supplier3[:id], name: "meth")





