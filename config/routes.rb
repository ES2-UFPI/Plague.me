Rails.application.routes.draw do
  root 'pages#home'

  get 'filtered_search/games', to: 'games#filtered_search', as: 'filtered_search_games'
  get 'users/:user_id/library', to: 'user_games#index', as: :user_library
  get 'user_games/:user_id/edit', to: 'user_games#edit'
  resources :promotions
  resources :games
  
  resources :platforms
  resources :developers
  resources :publishers
  resources :genres
  devise_for :users
  resources :users do
    resources :friend_requests, only: [:create, :destroy, :show] do
      member do
        put :accept
      end
    end
    member do
      get 'friends'
    end
  end
  resources :friendships, only: [:create, :destroy]
  resources :reviews
  resources :collections do
    delete 'games/:id', to: 'collections#remove_game', as: :remove_game
  end 
  resources :user_games, only: [:create, :edit, :update]
  resources :games do
    resources :user_games, only: [:create, :edit, :update]
    member do
      post 'wishlist'
      post 'favorite'
      post :add_to_collection
    end
      post 'create_review', on: :member
  end
  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :users
  end
  authenticate :user, ->(user) { user.is_admin? } do
    namespace :admin do
      root to: "users#index"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
