# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :todos, only: %i[index create destroy update]

  root 'sessions#welcome'

  get 'login', to: 'sessions#login_page'
  post 'login', to: 'sessions#login'
  get 'logout', to: 'sessions#logout'

  get 'welcome', to: 'sessions#welcome'
end
