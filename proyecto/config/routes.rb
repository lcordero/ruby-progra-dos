Rails.application.routes.draw do
   resources :facturas_vacunas do
    resources :vacunass
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
