Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :facturas do
    get 'test_endpoint', controller: 'productos', action: :my_custom_method
    resources :productos
  end
end
