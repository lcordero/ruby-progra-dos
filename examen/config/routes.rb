Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
  resources :zapatos
  resources :zapatitos
  get "zapatito/:id" , to: "zapatos#zapatito"
end
