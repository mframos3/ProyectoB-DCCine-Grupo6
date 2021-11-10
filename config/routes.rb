Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: [:new, :create, :show]
  resources :movie_shows, only: [:new, :create, :show]
end
