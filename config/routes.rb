Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions'
  }
  root to: 'home#index'
  resources :search_budgets, only: %i[show new create]
  resources :shipping_companies, only: %i[index show new create] do
    resources :vehicles, only: %i[new create]
    resources :price_settings, only: %i[new create]
    resources :delivery_times, only: %i[new create]
  end
  resources :orders, only: %i[index new create show] do
    get 'search', on: :collection
    post 'approved', on: :member
    post 'rejected', on: :member
    post 'delivered', on: :member
    resources :route_deliveries, only: :create
  end
end
