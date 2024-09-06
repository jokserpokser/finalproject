Rails.application.routes.draw do
  # Define the routes for IndexHomeController
  get 'index_home/index'

  # Cart routes
  get 'carts/show'
  resource :cart, only: [:show]

  # Devise routes for user authentication
  devise_for :users

  # Admin namespace routes
  namespace :admin do
    get 'pending/index'
    get 'home/index'
    resources :items
    get 'dashboard', to: 'home#index'
  end

  # User routes for profile management
  resource :user, only: [:show, :edit, :update]
  resources :cart_items, only: [:create]
  resources :carts, only: [:show] do
    post 'add_item', to: 'carts#add_item', as: 'add_item'
  end
  resources :items 
  
  
  # Static page routes
  get 'about_us', to: 'pages#about_us'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Set the root path route to the IndexHomeController's index action
  root "index_home#index"
end
