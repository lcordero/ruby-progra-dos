Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pharmacies do
    get "filtro", controller: "pharmacies", action: :filtro	  
    resources :medicos do
    resources :detalles
    end
  end
end
