Rails.application.routes.draw do
  root to: 'home#index'
  resources :shipping_companies, only: %i[index show new create] do
    resources :vehicles, only: %i[new create]
    resources :price_settings, only: %i[new create]
    resources :delivery_times, only: %i[new create]
  end
end
