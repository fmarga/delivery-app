Rails.application.routes.draw do
  root to: 'home#index'
  resources :shipping_company, only: [:index, :show]
end
