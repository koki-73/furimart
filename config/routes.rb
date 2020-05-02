Rails.application.routes.draw do
  devise_for :users
  root 'items#new'
  resources :items, only: [:index, :show, :new, :create, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: :show
  resources :my_pages, only: :index
  resources :categories, only: :show
  resources :brands, only: :index
  resources :purchases, only: [:new, :create]
end
