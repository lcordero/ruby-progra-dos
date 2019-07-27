Rails.application.routes.draw do
  #for details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ventas do
    resources :detalles
  end
 end
