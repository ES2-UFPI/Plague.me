Rails.application.routes.draw do
  resources :game_midia
  resources :publishers
  resources :games
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
