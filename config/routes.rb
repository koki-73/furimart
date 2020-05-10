Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :purchases, only: :index do
      collection do
        put 'pay', to: 'purchases#pay'
      end
    end
    resources :comments, only: :create
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  namespace :api do
    resources :items, only: :update, defaults: { format: 'json' }
  end
  resources :users, only: :show
  resources :my_pages, only: :index
  resources :categories, only: :show
  resources :brands, only: :index
  resources :credit_cards, only: :new do
    collection do
      post 'pay', to: 'credit_cards#pay'
      delete 'delete', to: 'credit_cards#delete'
      get 'show', to: 'credit_cards#show'
    end
  end
end
