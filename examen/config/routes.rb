Rails.application.routes.draw do
	#resources :patos
    #get "my_patito/:id", controller: "patos", action: :my_patito
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items
  end
    resources :patos
    get "my_patito/:id", controller: "patos", action: :my_patito
  end
