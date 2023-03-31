Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :todos, only: [:index, :create]

  root 'sessions#welcome'

  get 'login', to: 'sessions#login_page'
  post 'login', to: 'sessions#login'
  get 'logout', to: "sessions#logout"

  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
