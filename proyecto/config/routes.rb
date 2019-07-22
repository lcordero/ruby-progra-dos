Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pharmacies do
    resources :medicos do
    resources :detalle
    end
  end
end
