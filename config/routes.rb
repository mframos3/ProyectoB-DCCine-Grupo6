# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: %i[index new create]
  resources :movie_shows, only: %i[new create]
end
