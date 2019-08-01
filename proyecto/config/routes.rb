Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pharmacies do
    get "filter", controller: "pharmacies", action: :filter_recipes  		
    resources :recipes do
      resources :drugs
    end 
  end

end
