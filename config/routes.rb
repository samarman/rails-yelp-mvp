Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # List of all restaurants

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  root 'restaurants#index'
  # Add a new restaurant
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants', to: 'restaurants#create'

  # Details of a restaurant with reviews
  get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'

  # Add a new review to a restaurant
  get 'restaurants/:id/reviews/new', to: 'reviews#new'
  post 'restaurants/:id/reviews', to: 'reviews#create'
end
