Rails.application.routes.draw do
  devise_for :users
  root 'items#new'
  # root 'items#index'
  resources :items, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: :show
  resources :my_pages, only: :index
  # resources :items, only: [:show, :new, :create] 
  resources :categories, only: :show
  resources :brands, only: :index
end
