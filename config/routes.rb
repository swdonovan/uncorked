Rails.application.routes.draw do
  root to: "home#show"

  get "/login", to: "sessions#new"
  post "/login", to: "session#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:show]
end
