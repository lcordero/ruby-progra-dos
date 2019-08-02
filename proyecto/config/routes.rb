Rails.application.routes.draw do
  resources :sales do
    resources :details
  end
end
