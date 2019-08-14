Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :zapatos do
	  get "zapatito/#:id", to: "zapato/#:id"  
  	#resources :items
       
  end 
    
  
end
