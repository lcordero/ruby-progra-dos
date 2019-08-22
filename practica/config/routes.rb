Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do	  
    resources :items
  end
  resources :users
  get "custom/:id", to: "users#custom"
  #resources :gokus
  
  #get "custom/:id", to: "gokus#custom"
  #resources :autos
  #get "custom/:id", to: "autos#custom"
end


