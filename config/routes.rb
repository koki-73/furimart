Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :my_pages, only: :index
  resources :items, only: :show
  resources :categories, only: :show
  resources :brands, only: :index
end
