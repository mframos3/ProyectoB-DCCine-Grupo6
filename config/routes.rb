# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, only: %i[index new create show]
  resources :movie_shows, only: %i[new create show]
  resources :reservations, only: %i[index show]
  get 'new_reservation', to: 'reservations#new_reservation'
  post 'new_reservation', to: 'reservations#create_reservation'
end
