Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get "filtro", controller: "pharmacies", action: :filtro
  resources :pharmacies do
  resources :medicamentos do
      resources :detalles
    end
  end
end

