Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :my_pages, only: :index
  resources :items, only: :show
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
