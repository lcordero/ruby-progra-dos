Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drugstores do
    resources :suppliers do
      resources :drugs
    end
  end
end
