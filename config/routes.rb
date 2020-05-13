Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :items do
    resources :comments, only: :create
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only: [:index, :show] do
      collection do
        put 'pay', to: 'purchases#pay'
      end
    end
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
  resources :purchases, only: [:new, :create]
  resources :profiles, only: [:new, :create, :edit, :update]
end
