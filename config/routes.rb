# frozen_string_literal: true

Rails.application.routes.draw do
  

  #   root "hotels#index"
  root 'hotels#index'

  # Defines the route for signing up a new user
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  # Defines the route for logging in a user
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'

  # Defines the route for finding roomtypes
  get 'luxury', to: 'rooms#luxury'
  get 'deluxe', to: 'rooms#deluxe'
  get 'president', to: 'rooms#president'

  # Defines the route for finding hotels
  get 'search', to: 'hotels#search'
  

  # Defines the route for admin
  get 'admins', to: 'admins#index'
  get 'admins/pending_bookings', to: 'admins#pending_bookings'
  get 'admins/confirmed_bookings', to: 'admins#confirmed_bookings'

  # Defines the route for approving and rejecting bookings
  get 'admins/approve_booking/:id', to: 'admins#approve_booking', as: 'approve_booking'
  get 'admins/reject_booking/:id', to: 'admins#reject_booking', as: 'reject_booking'

  match 'admins/approve_booking/:id', to: 'admins#approve_booking', via: [:get, :patch]
  match 'admins/reject_booking/:id', to: 'admins#reject_booking', via: [:get, :patch]

  patch 'admins/approve_booking/:id', to: 'admins#approve_booking'
  patch 'admins/reject_booking/:id', to: 'admins#reject_booking'

  # Resources
  resources :hotels do
    resources :rooms
  end

  resources :bookings, only: [:index]

  resources :hotels

  resources :hotels do
    resources :rooms do
      resources :bookings, only: %i[new create]
    end
  end


end
