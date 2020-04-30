Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: :show
  resources :my_pages, only: :index
  resources :items, only: :show
  resources :categories, only: :show
  resources :brands, only: :index
  resources :credit_cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end
