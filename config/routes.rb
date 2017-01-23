Rails.application.routes.draw do
  
  root "users#index"
  
  get "/login", to: "sessions#new"
  resources :users
  resources :sessions
  resources :events
end
