# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new', as: :login
  post 'sessions/create', as: :signin
  delete 'sessions/destroy', to: 'sessions#destroy', as: :signout
  get 'pages/get_started', as: :get_started
  resources :events
  resources :users, except: %i[index show]

  resources :configurations, only: [] do
    get :ios, on: :collection
  end

  root 'events#index'
end
