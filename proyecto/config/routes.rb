Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drugstores do
    resources :vaccines do
      resources :illnesses
    end
  end
end
