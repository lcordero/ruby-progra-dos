Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :zapatos
   resources :todos do
 
    resources :items
  end
   
  get "/zapatito/:id", to: "zapatos#zapatito"
 
end


