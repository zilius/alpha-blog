Rails.application.routes.draw do
  root to: "application#home"
  resources :articles
  get "signup", to: "users#new"
  resources :users, except: [:new]
end
