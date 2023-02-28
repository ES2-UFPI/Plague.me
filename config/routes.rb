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
  Rails.application.routes.draw do
  resources :games do
      post 'create_review', on: :member
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
