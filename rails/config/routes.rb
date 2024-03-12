# frozen_string_literal: true

Rails.application.routes.draw do
  # SESSIONS
  get 'sessions/new', as: :login
  post 'sessions/create', as: :signin
  delete 'sessions/destroy', to: 'sessions#destroy', as: :signout

  # CUSTOM PAGES
  get 'pages/get_started', as: :get_started
  get 'pages/support', as: :support
  get 'pages/policy', as: :policy
  get 'pages/event_example', as: :event_example
  get 'pages/event_example2', as: :event_example2

  # RESOURCES
  resources :events
  resources :users, except: %i[index show]
  resources :configurations, only: [] do
    get :ios, on: :collection
  end

  # ROOT
  root 'events#index'
end
