Rails.application.routes.draw do

  get 'filtered_search/games', to: 'games#filtered_search', as: 'filtered_search_games'
  resources :promotions
  resources :games
  root 'pages#home'
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
  resources :games do
    member do
      post 'favorite'
      post :add_to_collection
    end
      post 'create_review', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
