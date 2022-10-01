Rails.application.routes.draw do
  root to: "application#home"
  resources :articles
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "delete", to: "sessions#destroy"
  resources :users, except: [:new]
end
