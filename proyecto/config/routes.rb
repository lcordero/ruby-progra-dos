Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "filtro", controller: "clientes", action: :filtroClientes
  resources :clientes do
    resources :detalles
  end
end
