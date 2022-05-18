Rails.application.routes.draw do
  root to: 'home#index'
  resources :shipping_companies, only: [:index, :show, :new, :create]
  resources :vehicles, only: [:index]
end
