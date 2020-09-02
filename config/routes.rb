Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :sales do
      resources :adresses
    end  
  end  
  resources :users
  


end
