Rails.application.routes.draw do
  resources :facturasvacunas do
    resources :vacunas
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
end
