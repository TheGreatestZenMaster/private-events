Rails.application.routes.draw do
  
  root "users#index"
  
  get "/login", to: "sessions#new"
  get "/signup", to: "users#new"
  get "/logout", to: "sessions#destroy"
  resources :users
  resources :sessions
  resources :events
  resources :invitations
end
