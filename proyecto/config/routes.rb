Rails.application.routes.draw do
  resources :sales do
    resources :details
  end
  get "filtro", controller:"drugstores", action: :filtro_drugs
end
