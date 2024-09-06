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
    resources :user_list
  end

  # User routes for profile management
  resource :user, only: [:show, :edit, :update]

  # Static page routes
  get 'about_us', to: 'pages#about_us'

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Set the root path route to the IndexHomeController's index action
  root "index_home#index"
end
