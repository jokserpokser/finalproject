Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get 'pending/index'
    get 'home/index'
    resources :items
    get 'dashboard', to: 'home#index'
  end

  resource :user, only: [:show, :edit, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
