Rails.application.routes.draw do
   resources :inventarios do
     resources :productos
     #get "inventarios/:id/productos/:id", controller: "productos", action: :alerta_productos 
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
