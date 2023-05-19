Rails.application.routes.draw do
  # List of all restaurants
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  # Add a new restaurant
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants', to: 'restaurants#create'

  # Add a new review to a restaurant
  get 'restaurants/:id/reviews/new', to: 'reviews#new'
  post 'restaurants/:id/reviews', to: 'reviews#create'

  root 'restaurants#index'
end
