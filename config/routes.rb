Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :dishes
  resources :categories
  resources :menus

  get 'index', to: 'home#index'
  get 'login', to: 'home#login'
  get 'data', to: 'menus#data'
end
