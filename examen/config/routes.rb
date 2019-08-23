Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos do
    resources :items

    resources :pato
    get "my_patito/:id", to: "patos#my_patito"
  end
end
