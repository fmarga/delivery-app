Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'home#index'
  resources :shipping_companies, only: %i[index show new create] do
    resources :vehicles, only: %i[new create]
    resources :price_settings, only: %i[new create]
    resources :delivery_times, only: %i[new create]
  end
  resources :search_budgets, only: %i[new create show]
end
