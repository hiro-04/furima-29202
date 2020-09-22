Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users
  resources :items do
    resources :orders
  end
end
