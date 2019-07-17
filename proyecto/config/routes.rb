Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drugstores do
    get "filter", controller: "drugstores", action: :filter_drugs
    resources :suppliers do
      resources :drugs
    end
  end
end
